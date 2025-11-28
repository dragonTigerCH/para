'use client';

import { ParaItem } from '@/lib/types';
import { getCategoryColor } from '@/lib/para-utils';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Calendar, Tag, Edit } from 'lucide-react';

interface ItemDetailProps {
  item: ParaItem;
}

export function ItemDetail({ item }: ItemDetailProps) {
  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="bg-white border border-gray-200 rounded-lg p-8">
        <div className="flex items-start justify-between mb-6">
          <div className="flex-1">
            <div className="flex items-center gap-3 mb-2">
              <Badge className={getCategoryColor(item.category)}>
                {item.category}
              </Badge>
              {item.status && (
                <Badge variant="outline">{item.status}</Badge>
              )}
            </div>
            <h2 className="text-3xl font-bold mb-2">{item.name}</h2>
            {item.topic && (
              <div className="flex items-center gap-2 text-gray-600">
                <Tag className="size-4" />
                <span>{item.topic}</span>
              </div>
            )}
          </div>
          <Button>
            <Edit className="size-4 mr-1" />
            편집
          </Button>
        </div>

        <div className="space-y-6">
          {(item.startDate || item.endDate) && (
            <div className="border-t border-gray-200 pt-6">
              <div className="flex items-start gap-3">
                <Calendar className="size-5 text-gray-500 mt-1" />
                <div>
                  <h3 className="text-lg font-semibold mb-2">기간</h3>
                  <div className="space-y-1">
                    {item.startDate && (
                      <p className="text-gray-600">시작: {item.startDate}</p>
                    )}
                    {item.endDate && (
                      <p className="text-gray-600">종료: {item.endDate}</p>
                    )}
                  </div>
                </div>
              </div>
            </div>
          )}

          {item.tags.length > 0 && (
            <div className="border-t border-gray-200 pt-6">
              <div className="flex items-start gap-3">
                <Tag className="size-5 text-gray-500 mt-1" />
                <div>
                  <h3 className="text-lg font-semibold mb-2">태그</h3>
                  <div className="flex gap-2 flex-wrap">
                    {item.tags.map((tag, idx) => (
                      <Badge key={idx} variant="secondary">
                        {tag}
                      </Badge>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          )}

          {item.description && (
            <div className="border-t border-gray-200 pt-6">
              <h3 className="text-lg font-semibold mb-2">설명</h3>
              <p className="text-gray-700 leading-relaxed">{item.description}</p>
            </div>
          )}

          <div className="border-t border-gray-200 pt-6">
            <h3 className="text-lg font-semibold mb-4">추가 정보</h3>
            <div className="grid grid-cols-2 gap-4">
              <div className="bg-gray-50 rounded-lg p-4">
                <p className="text-sm text-gray-600 mb-1">카테고리 유형</p>
                <p className="font-medium">{item.category}</p>
              </div>
              <div className="bg-gray-50 rounded-lg p-4">
                <p className="text-sm text-gray-600 mb-1">항목 ID</p>
                <p className="font-mono text-sm text-gray-700">{item.id}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
