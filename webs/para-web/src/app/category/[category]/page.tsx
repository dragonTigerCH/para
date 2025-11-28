'use client';

import { useParams, useRouter } from 'next/navigation';
import { CategoryDetail } from '@/components/para/CategoryDetail';
import { mockData } from '@/lib/data';
import { ParaCategory } from '@/lib/types';
import { Button } from '@/components/ui/button';
import { ChevronLeft } from 'lucide-react';

export default function CategoryPage() {
  const params = useParams();
  const router = useRouter();
  const category = (params.category as string).charAt(0).toUpperCase() + (params.category as string).slice(1) as ParaCategory;

  // TODO: 백엔드 연동 시 useParaItemsByCategory(category) 사용
  const categoryData = category === 'Pinned'
    ? mockData.filter(item => item.isPinned === true)
    : mockData.filter(item => item.category === category);

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
        <CategoryDetail category={category} data={categoryData} />
      </main>
    </div>
  );
}
