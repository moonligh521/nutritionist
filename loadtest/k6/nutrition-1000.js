import http from 'k6/http';
import { check } from 'k6';

export const options = {
  scenarios: {
    mixed_api: {
      executor: 'constant-arrival-rate',
      rate: 1000,
      timeUnit: '1s',
      duration: __ENV.DURATION || '30s',
      preAllocatedVUs: 200,
      maxVUs: 1500,
    },
  },
  thresholds: {
    http_req_failed: ['rate<0.01'],
    http_req_duration: ['p(95)<500'],
  },
};

const baseUrl = __ENV.BASE_URL || 'http://127.0.0.1:18091';

export default function () {
  const response = http.get(`${baseUrl}/actuator/health/liveness`);
  check(response, { 'liveness responds': (result) => result.status === 200 });
}
