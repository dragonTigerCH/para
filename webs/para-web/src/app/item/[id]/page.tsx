'use client';

import { useParams, useRouter } from 'next/navigation';
import { ItemDetail } from '@/components/para/ItemDetail';
import { mockData } from '@/lib/data';
import { Button } from '@/components/ui/button';
import { ChevronLeft } from 'lucide-react';

export default function ItemPage() {
  const params = useParams();
  const router = useRouter();
  const itemId = params.id as string;

  // TODO: 백엔드 연동 시 useParaItem(itemId) 사용
  const item = mockData.find(item => item.id === itemId);

  if (!item) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <p className="text-gray-600 mb-4">항목을 찾을 수 없습니다</p>
          <Button onClick={() => router.push('/')}>
            홈으로 돌아가기
          </Button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-200 px-6 py-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-4">
            <Button
              variant="ghost"
              size="sm"
              onClick={() => router.back()}
            >
              <ChevronLeft className="size-4 mr-1" />
              Back
            </Button>
            <div className="flex items-center gap-2">
              <div className="size-8 bg-gray-200 rounded flex items-center justify-center">
                <span className="text-gray-600">📚</span>
              </div>
              <h1 className="text-xl font-bold">PARA</h1>
            </div>
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto p-6">
        <ItemDetail item={item} />
      </main>
    </div>
  );
}
