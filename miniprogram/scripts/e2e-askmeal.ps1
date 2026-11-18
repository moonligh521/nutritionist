# 模拟小程序问餐页：真实 warmup + SSE turns + matches 探针
$ErrorActionPreference = "Stop"
$base = "http://127.0.0.1:18091"
$stamp = [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()
$sessionId = "mp-e2e-s-$stamp"
$patientId = "mp-e2e-p-$stamp"
$foods = @("番茄", "鸡蛋", "豆腐", "青椒", "土豆")
$pass = 0
$fail = 0

function Write-Node($id, $ok, $detail) {
  $mark = if ($ok) { "PASS" } else { "FAIL" }
  Write-Host ("  [{0}] {1}  {2}" -f $mark, $id, $detail)
  if ($ok) { $script:pass++ } else { $script:fail++ }
}

function Invoke-Warmup {
  param($title)
  Write-Host "`n==== $title ===="
  $url = "$base/api/nutrition/agent/sessions/$sessionId/preference/warmup"
  $body = @{ patientId = $patientId } | ConvertTo-Json
  try {
    $res = Invoke-RestMethod -Uri $url -Method POST -Body $body -ContentType "application/json; charset=utf-8" -TimeoutSec 30
    $ok = ($res.code -eq 200 -or $res.code -eq 0) -and $null -ne $res.data
    Write-Node "WARMUP" $ok ("epoch=" + $res.data.preferenceEpoch + " phase=" + $res.data.phase)
    return $ok
  } catch {
    Write-Node "WARMUP" $false $_.Exception.Message
    return $false
  }
}

function Parse-SseReply([string]$raw) {
  $event = ""
  $data = New-Object System.Text.StringBuilder
  $reply = $null
  foreach ($line in ($raw -split "`n")) {
    $row = $line.TrimEnd("`r")
    if ($row.StartsWith("event:")) {
      $event = $row.Substring(6).Trim()
    } elseif ($row.StartsWith("data:")) {
      if ($data.Length -gt 0) { [void]$data.Append("`n") }
      [void]$data.Append($row.Substring(5).Trim())
    } elseif ($row -eq "") {
      if ($event -eq "reply" -and $data.Length -gt 0) {
        $reply = $data.ToString() | ConvertFrom-Json
      }
      $event = ""
      $data = New-Object System.Text.StringBuilder
    }
  }
  if ($event -eq "reply" -and $data.Length -gt 0) {
    $reply = $data.ToString() | ConvertFrom-Json
  }
  return $reply
}

function Assert-Biz($title, $reply) {
  $plan = @($reply.plan)
  $dishes = @($reply.dishes)
  $applied = @($reply.appliedEvents)
  if ($title -like "R2*" -or $title -like "R4*") {
    return ($dishes.Count -ge 1)
  }
  if ($title -like "R3*") {
    return ($applied.Count -ge 1) -and ($reply.preferenceEpoch -ge 1) -and -not ($plan -contains "OUT_OF_SCOPE")
  }
  if ($title -like "R5*" -or $title -like "R6*") {
    return ($dishes.Count -ge 1) -or ($plan -contains "CLARIFY")
  }
  if ($title -like "R8*") {
    $retract = $applied | Where-Object { $_.op -eq "RETRACT" }
    return (@($retract).Count -ge 1) -or (($reply.rememberedHint + "") -match "撤销") -or ($reply.preferenceEpoch -ge 1)
  }
  if ($title -like "R9*") {
    return (-not [string]::IsNullOrEmpty($reply.memoryAnswer)) -and -not ($plan -contains "OUT_OF_SCOPE")
  }
  if ($title -like "R10*") {
    $guides = @($reply.guideActions)
    return ($guides -contains "ADD_FOODS") -or ($reply.phase -eq "EMPTY_GUIDE")
  }
  return $true
}

function Invoke-Turn {
  param($title, $text, $foodList)
  Write-Host "`n==== $title ===="
  Write-Host ("  user: " + $text)
  $payload = @{
    sessionId = $sessionId
    patientId = $patientId
    text = $text
    foods = @($foodList)
    conditions = @()
    allergens = @()
    avoidFoods = @()
    preferTags = @()
    preferCuisines = @()
    confirmations = @()
  } | ConvertTo-Json -Depth 5
  try {
    $resp = Invoke-WebRequest -Uri "$base/api/nutrition/agent/turns" -Method POST -Body ([System.Text.Encoding]::UTF8.GetBytes($payload)) `
      -ContentType "application/json; charset=utf-8" -Headers @{ Accept = "text/event-stream" } -TimeoutSec 120
    $raw = $resp.Content
    $reply = Parse-SseReply $raw
    $hasReply = $null -ne $reply
    Write-Node "SSE_ENVELOPE" $hasReply ("len=" + $raw.Length)
    if (-not $hasReply) { return $false }
    $plan = @($reply.plan)
    Write-Node "UNDERSTAND_PLAN" ($plan.Count -gt 0 -or $reply.explanation -or $reply.dishes -or $reply.memoryAnswer -or $reply.rememberedHint) ("plan=" + ($plan -join ",") + " phase=" + $reply.phase)
    $dishes = @($reply.dishes)
    $applied = @($reply.appliedEvents)
    $rulesOk = $true
    if ($title -like "R3*" -or $title -like "R8*") { $rulesOk = ($applied.Count -ge 1) }
    if ($title -like "R9*") { $rulesOk = -not [string]::IsNullOrEmpty($reply.memoryAnswer) }
    Write-Node "RULES_MEMORY" $rulesOk ("epoch=" + $reply.preferenceEpoch + " applied=" + $applied.Count + " mem=" + $(if ($reply.memoryAnswer) { "Y" } else { "N" }))
    $recallOk = $true
    if ($title -like "R2*" -or $title -like "R4*" -or $title -like "R5*" -or $title -like "R6*") {
      $recallOk = ($dishes.Count -ge 1) -or ($plan -contains "CLARIFY")
    } elseif ($title -like "R10*") {
      $recallOk = (@($reply.guideActions) -contains "ADD_FOODS") -or ($reply.phase -eq "EMPTY_GUIDE")
    } else {
      $recallOk = ($dishes.Count -gt 0) -or $reply.fallback -or $reply.emptyReason -or ($plan -contains "GREETING") -or ($plan -contains "REPLACE_ONE") -or ($plan -contains "ADD_KIND") -or ($plan -contains "CLARIFY") -or $reply.memoryAnswer -or $reply.rememberedHint
    }
    Write-Node "RECALL_EXECUTE" $recallOk ("dishes=" + $dishes.Count + " empty=" + $reply.emptyReason + " degrade=" + $reply.degradeStep + " guide=" + ((@($reply.guideActions) -join ",")))
    Write-Node "SESSION" ([string]::IsNullOrEmpty($reply.sessionId) -eq $false) ("rev=" + $reply.revision)
    $biz = Assert-Biz $title $reply
    Write-Node "BUSINESS" $biz ("hint=" + $reply.rememberedHint)
    $names = ($dishes | ForEach-Object { $_.name }) -join "、"
    if ($names) { Write-Host ("  dishes: " + $names) }
    if ($reply.explanation) { Write-Host ("  explain: " + $reply.explanation.Substring(0, [Math]::Min(120, $reply.explanation.Length))) }
    if ($reply.memoryAnswer) { Write-Host ("  memory: " + $reply.memoryAnswer) }
    return $biz
  } catch {
    Write-Node "SSE_ENVELOPE" $false $_.Exception.Message
    return $false
  }
}

function Invoke-MatchesXyz {
  Write-Host "`n==== R7 点名不存在菜系 ===="
  $qs = "foods=番茄&foods=鸡蛋&cuisine=XYZ&text=" + [uri]::EscapeDataString("不存在的菜系XYZ")
  try {
    $res = Invoke-RestMethod -Uri "$base/api/nutrition/catalog/matches?$qs" -Method GET -TimeoutSec 30
    $data = $res.data
    $count = @($data.dishes).Count
    $reason = [string]$data.emptyReason
    $ok = ($count -eq 0) -and ($reason -ne "FALLBACK_ALL_PUBLISHED")
    Write-Node "RECALL_EXECUTE" $ok ("dishes=$count reason=$reason")
    return $ok
  } catch {
    Write-Node "RECALL_EXECUTE" $false $_.Exception.Message
    return $false
  }
}

Write-Host "E2E base=$base session=$sessionId patient=$patientId"

# health
try {
  $h = Invoke-RestMethod -Uri "$base/actuator/health" -TimeoutSec 10
  Write-Host ("health=" + $h.status)
} catch {
  Write-Host "health check failed: $($_.Exception.Message)"
  exit 2
}

$ok = Invoke-Warmup "R0 打开问餐"
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-Turn "R1 问候" "你好" @()
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-Turn "R2 荐菜" "想吃川菜，家里有番茄鸡蛋豆腐" $foods
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-Turn "R3 绝对忌口" "我绝对不能吃香菜" @()
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-Turn "R4 再荐菜" "番茄鸡蛋豆腐推荐几道" $foods
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-Turn "R5 换一个" "换一个" @()
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-Turn "R6 再加个汤" "再加个汤" @()
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-MatchesXyz
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-Turn "R8 改口" "可以吃香菜了" @()
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-Turn "R9 记忆问答" "我现在不喜欢什么" @()
if (-not $ok) { Write-Host "STOP"; exit 1 }
$ok = Invoke-Turn "R10 无食材引导" "帮我推荐" @()

Write-Host "`n======== SUMMARY pass=$pass fail=$fail ========"
if ($fail -gt 0) { exit 1 } else { exit 0 }
