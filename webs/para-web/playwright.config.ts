import { defineConfig, devices } from '@playwright/test';

/**
 * Playwright 설정
 * @see https://playwright.dev/docs/test-configuration
 */
export default defineConfig({
  testDir: './tests/e2e',

  /* 병렬 실행 설정 */
  fullyParallel: true,

  /* CI에서 실패 시 재시도하지 않음 */
  forbidOnly: !!process.env.CI,

  /* CI에서는 재시도 안함 */
  retries: process.env.CI ? 2 : 0,

  /* 병렬 워커 수 */
  workers: process.env.CI ? 1 : undefined,

  /* 리포터 설정 */
  reporter: 'html',

  /* 모든 테스트의 공통 설정 */
  use: {
    /* Base URL */
    baseURL: 'http://localhost:3000',

    /* 테스트 실패 시 스크린샷 */
    screenshot: 'only-on-failure',

    /* 테스트 실패 시 trace 수집 */
    trace: 'on-first-retry',
  },

  /* 프로젝트별 설정 */
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
  ],

  /* 개발 서버 자동 시작 */
  webServer: {
    command: 'npm run dev',
    url: 'http://localhost:3000',
    reuseExistingServer: !process.env.CI,
    timeout: 120000,
  },
});
