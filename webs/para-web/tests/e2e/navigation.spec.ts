import { test, expect } from '@playwright/test';

/**
 * 페이지 네비게이션 테스트
 */
test.describe('PARA 네비게이션', () => {
  test('Pinned 카테고리를 클릭하면 상세 페이지로 이동해야 함', async ({ page }) => {
    await page.goto('/');

    // Pinned 버튼 클릭
    await page.click('button:has-text("📌 Pinned")');

    // URL 확인
    await expect(page).toHaveURL('/category/pinned');

    // 페이지 제목 확인
    await expect(page.locator('h2')).toContainText('Pinned');
  });

  test('Inbox 카테고리를 클릭하면 상세 페이지로 이동해야 함', async ({ page }) => {
    await page.goto('/');

    // Inbox 버튼 클릭
    await page.click('button:has-text("📥 Inbox")');

    // URL 확인
    await expect(page).toHaveURL('/category/inbox');

    // 페이지 제목 확인
    await expect(page.locator('h2')).toContainText('Inbox');
  });

  test('Project 카테고리 상세 보기를 클릭하면 상세 페이지로 이동해야 함', async ({ page }) => {
    await page.goto('/');

    // PARA 섹션들 중에서 정확히 "Project" 카테고리 찾기
    // h3 텍스트가 정확히 "Project"로 시작하는 섹션 찾기
    const projectSection = page.locator('div.bg-white.border.border-gray-200.rounded-lg')
      .filter({ has: page.locator('h3').filter({ hasText: /^Project/ }) })
      .first();

    // 해당 섹션의 상세 보기 버튼 클릭
    await projectSection.locator('button:has-text("상세 보기")').click();

    // URL 확인
    await expect(page).toHaveURL(/\/category\/project/);

    // 페이지 제목 확인
    await expect(page.locator('h2')).toContainText('Project');
  });

  test('카테고리 상세 페이지에서 Back 버튼을 클릭하면 홈으로 돌아가야 함', async ({ page }) => {
    // 홈에서 시작
    await page.goto('/');

    // 카테고리로 이동
    await page.click('button:has-text("📥 Inbox")');
    await expect(page).toHaveURL(/\/category\/inbox/);

    // Back 버튼 클릭
    await page.click('button:has-text("Back")');

    // 홈페이지로 돌아왔는지 확인
    await expect(page).toHaveURL('/');
    await expect(page.locator('h2').first()).toContainText('전체 보기');
  });

  test('테이블의 아이템을 클릭하면 아이템 상세 페이지로 이동해야 함', async ({ page }) => {
    await page.goto('/');

    // Project 섹션 확장 (이미 확장되어 있을 수 있음)
    const projectSection = page.locator('div:has(h3:has-text("Project"))');

    // 테이블의 첫 번째 행 클릭
    const firstRow = projectSection.locator('tbody tr').first();
    await firstRow.click();

    // 아이템 상세 페이지로 이동했는지 확인
    await expect(page).toHaveURL(/\/item\/.+/);

    // 아이템 제목이 있는지 확인
    await expect(page.locator('h2')).toBeVisible();
  });

  test('아이템 상세 페이지에서 Back 버튼을 클릭하면 이전 페이지로 돌아가야 함', async ({ page }) => {
    // 홈에서 시작
    await page.goto('/');

    // Pinned 카테고리로 이동
    await page.click('button:has-text("📌 Pinned")');
    await expect(page).toHaveURL(/\/category\/pinned/);

    // 첫 번째 아이템 클릭
    await page.click('tbody tr:first-child');
    await expect(page).toHaveURL(/\/item\/.+/);

    // 아이템 페이지에서 Back 클릭
    await page.click('button:has-text("Back")');

    // 카테고리 페이지로 돌아왔는지 확인
    await expect(page).toHaveURL(/\/category\/pinned/);
  });

  test('카테고리 섹션을 접고 펼칠 수 있어야 함', async ({ page }) => {
    await page.goto('/');

    // PARA 섹션 중 정확히 "Project"로 시작하는 첫 번째 섹션
    const projectSection = page.locator('div.bg-white.border.border-gray-200.rounded-lg')
      .filter({ has: page.locator('h3').filter({ hasText: /^Project/ }) })
      .first();

    // ChevronDown 또는 ChevronRight 아이콘이 있는 토글 버튼
    const toggleButton = projectSection.locator('button').filter({ has: page.locator('svg') }).first();

    // 테이블의 부모 div (overflow-x-auto)를 찾아서 확인
    const tableContainer = projectSection.locator('div.overflow-x-auto');

    // 처음에 테이블이 보이는지 확인
    await expect(tableContainer).toBeVisible();

    // 토글 버튼 클릭 (접기)
    await toggleButton.click();

    // 테이블 컨테이너가 숨겨졌는지 확인
    await expect(tableContainer).not.toBeVisible();

    // 다시 토글 (펼치기)
    await toggleButton.click();

    // 테이블 컨테이너가 다시 보이는지 확인
    await expect(tableContainer).toBeVisible();
  });
});
