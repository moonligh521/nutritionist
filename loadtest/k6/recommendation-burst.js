import http from 'k6/http';
import { check } from 'k6';

export const options = {
  scenarios: {
    recommendation_burst: {
      executor: 'ramping-arrival-rate',
      startRate: 10,
      timeUnit: '1s',
      preAllocatedVUs: 100,
      maxVUs: 500,
      stages: [
        { target: 200, duration: '10s' },
        { target: 200, duration: __ENV.DURATION || '20s' },
        { target: 0, duration: '5s' },
      ],
    },
  },
  thresholds: {
    http_req_failed: ['rate<0.01'],
    http_req_duration: ['p(95)<100'],
  },
};

const baseUrl = __ENV.BASE_URL || 'http://127.0.0.1:18091';

export default function () {
  const suffix = `${__VU}-${__ITER}`;
  const body = JSON.stringify({
    patientId: __ENV.PATIENT_ID || 'pat-1',
    patientVersion: 'pv1',
    profileVersion: 'profile-1',
    pantryVersion: 'pantry-1',
    scopeCode: 1,
    mealTypeCode: 2,
    date: '2026-11-10',
    timezone: 'Asia/Shanghai',
    pantryModeCode: 2,
  });
  const response = http.post(`${baseUrl}/api/nutrition/recommendations`, body, {
    headers: {
      'Content-Type': 'application/json',
      'Idempotency-Key': `k6-rec-${suffix}`,
      'X-Account-Id': __ENV.ACCOUNT_ID || 'dev-account',
      'X-Account-Role': 'patient',
    },
  });
  check(response, { 'accepted without blocking': (result) => result.status === 200 });
}
