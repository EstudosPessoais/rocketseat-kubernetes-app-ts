import { Controller, Get } from '@nestjs/common';
import { HealthService } from './health.service';

@Controller()
export class HealthController {
  constructor(private readonly healthService: HealthService) {}

  @Get('/healthz')
  checkHealth(): string {
    return this.healthService.checkHealth();
  }

  @Get('/readyz')
  checkReady(): string {
    return this.healthService.checkReady();
  }
}
