import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 100 },
    { duration: '1m30s', target: 150 },
    { duration: '5m', target: 250 },
  ],
};

export default function () {
  const res = http.get('http://goapp.johnydev.com');
  check(res, { 'status was 200': (r) => r.status == 200 });
  sleep(1);
}
