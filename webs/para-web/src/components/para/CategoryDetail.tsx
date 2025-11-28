'use client';

import { useRouter } from 'next/navigation';
import { ParaItem, ParaCategory } from '@/lib/types';
import { getCategoryColor, getCategoryDescription } from '@/lib/para-utils';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Plus } from 'lucide-react';

interface CategoryDetailProps {
  category: ParaCategory;
  data: ParaItem[];
}

export function CategoryDetail({ category, data }: CategoryDetailProps) {
  const router = useRouter();

  const handleItemClick = (item: ParaItem) => {
    router.push(`/item/${item.id}`);
  };

  return (
    <div className="space-y-6">
      <div className="bg-white border border-gray-200 rounded-lg p-6">
        <div className="flex items-center justify-between mb-4">
          <div>
            <div className="flex items-center gap-3 mb-2">
              <h2 className="text-2xl font-bold">{category}</h2>
              <Badge className={getCategoryColor(category)}>{data.length} 항목</Badge>
            </div>
            <p className="text-gray-600">
              {getCategoryDescription(category)}
            </p>
          </div>
          <Button>
            <Plus className="size-4 mr-1" />
            새 항목
          </Button>
        </div>
      </div>

      <div className="bg-white border border-gray-200 rounded-lg overflow-hidden">
        {data.length > 0 ? (
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="px-6 py-4 text-left text-sm font-medium text-gray-600">이름</th>
                  <th className="px-6 py-4 text-left text-sm font-medium text-gray-600">PARA</th>
                  <th className="px-6 py-4 text-left text-sm font-medium text-gray-600">Topic</th>
                  <th className="px-6 py-4 text-left text-sm font-medium text-gray-600">태그</th>
                  <th className="px-6 py-4 text-left text-sm font-medium text-gray-600">기간</th>
                  <th className="px-6 py-4 text-left text-sm font-medium text-gray-600">상태</th>
                </tr>
              </thead>
              <tbody>
                {data.map((item) => (
                  <tr
                    key={item.id}
                    onClick={() => handleItemClick(item)}
                    className="border-b border-gray-100 hover:bg-gray-50 cursor-pointer transition-colors"
                  >
                    <td className="px-6 py-4">
                      <div className="flex items-center gap-2">
                        <span className="font-medium">{item.name}</span>
                      </div>
                    </td>
                    <td className="px-6 py-4">
                      <Badge className={getCategoryColor(item.category)}>
                        {item.category}
                      </Badge>
                    </td>
                    <td className="px-6 py-4">
                      {item.topic && (
                        <Badge variant="outline">{item.topic}</Badge>
                      )}
                    </td>
                    <td className="px-6 py-4">
                      <div className="flex gap-1 flex-wrap">
                        {item.tags.map((tag, idx) => (
                          <Badge key={idx} variant="secondary">
                            {tag}
                          </Badge>
                        ))}
                      </div>
                    </td>
                    <td className="px-6 py-4 text-gray-600 text-sm">
                      {item.startDate && item.endDate ? (
                        <div className="space-y-1">
                          <div>{item.startDate} →</div>
                          <div>{item.endDate}</div>
                        </div>
                      ) : (
                        <span>-</span>
                      )}
                    </td>
                    <td className="px-6 py-4">
                      {item.status && (
                        <Badge variant="outline">{item.status}</Badge>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        ) : (
          <div className="p-12 text-center">
            <p className="text-gray-500 mb-4">아직 항목이 없습니다</p>
            <Button>
              <Plus className="size-4 mr-1" />
              첫 번째 항목 추가하기
            </Button>
          </div>
        )}
      </div>
    </div>
  );
}
