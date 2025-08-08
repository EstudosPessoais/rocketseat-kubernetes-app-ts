import { Injectable } from '@nestjs/common';

@Injectable()
export class HealthService {
  checkHealth(): string {
    console.log('Health Executado!');
    return 'OK';
  }

  checkReady(): string {
    console.log('Check Executado!');
    return 'OK!';
  }
}
