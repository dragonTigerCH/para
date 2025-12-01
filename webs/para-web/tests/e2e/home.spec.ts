import { test, expect } from '@playwright/test';

/**
 * 홈페이지 기본 렌더링 테스트
 */
test.describe('PARA 홈페이지', () => {
  test('페이지가 정상적으로 로드되어야 함', async ({ page }) => {
    // 홈페이지 접속
    await page.goto('/');

    // 헤더 타이틀 확인
    await expect(page.locator('h1')).toContainText('PARA Table Template');

    // 아이콘 확인
    await expect(page.locator('header span')).toContainText('📚');
  });

  test('전체 보기 제목과 설명이 표시되어야 함', async ({ page }) => {
    await page.goto('/');

    // 메인 제목
    await expect(page.locator('h2').first()).toContainText('전체 보기');

    // 설명 텍스트
    await expect(page.getByText('모든 PARA 항목을 한눈에 확인하세요')).toBeVisible();
  });

  test('Pinned 카테고리 버튼이 표시되어야 함', async ({ page }) => {
    await page.goto('/');

    // Pinned 버튼 찾기
    const pinnedButton = page.locator('button:has-text("📌 Pinned")');

    await expect(pinnedButton).toBeVisible();
    await expect(pinnedButton).toContainText('자주 사용하는 항목을 여기에 고정하세요');
  });

  test('Inbox 카테고리 버튼이 표시되어야 함', async ({ page }) => {
    await page.goto('/');

    // Inbox 버튼 찾기
    const inboxButton = page.locator('button:has-text("📥 Inbox")');

    await expect(inboxButton).toBeVisible();
    await expect(inboxButton).toContainText('아직 분류되지 않은 새로운 항목들');
  });

  test('모든 PARA 카테고리(Project, Area, Resource, Archive)가 표시되어야 함', async ({ page }) => {
    await page.goto('/');

    // 각 카테고리 확인
    const categories = ['Project', 'Area', 'Resource', 'Archive'];

    for (const category of categories) {
      const categorySection = page.locator(`h3:has-text("${category}")`);
      await expect(categorySection).toBeVisible();
    }
  });

  test('카테고리별 항목 개수가 표시되어야 함', async ({ page }) => {
    await page.goto('/');

    // Pinned 개수 확인 (숫자가 있어야 함)
    const pinnedCount = page.locator('button:has-text("📌 Pinned")').locator('span.text-gray-400');
    await expect(pinnedCount).toBeVisible();

    // Inbox 개수 확인
    const inboxCount = page.locator('button:has-text("📥 Inbox")').locator('span.text-gray-400');
    await expect(inboxCount).toBeVisible();
  });
});
