'use client';

import { ParaOverview } from '@/components/para/ParaOverview';
import { useParaItems } from '@/hooks/use-para-items';
import { mockData } from '@/lib/data';

export default function HomePage() {
  // TODO: 백엔드 연동 시 useParaItems() 사용
  // const { items, isLoading } = useParaItems();

  // 현재는 mock 데이터 사용
  const items = mockData;
  const isLoading = false;

  if (isLoading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <p className="text-gray-600">로딩 중...</p>
      </div>
    );
  }
  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-200 px-6 py-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2">
            <div className="size-8 bg-gray-200 rounded flex items-center justify-center">
              <span className="text-gray-600">📚</span>
            </div>
            <h1 className="text-xl font-bold">PARA</h1>
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto p-6">
        <ParaOverview data={items} />
      </main>
    </div>
  );
}
