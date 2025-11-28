'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { ParaItem, ParaCategory } from '@/lib/types';
import { getCategoryColor, PARA_CATEGORIES } from '@/lib/para-utils';
import { ChevronDown, ChevronRight } from 'lucide-react';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';

interface ParaOverviewProps {
  data: ParaItem[];
}

export function ParaOverview({ data }: ParaOverviewProps) {
  const router = useRouter();
  const [expandedSections, setExpandedSections] = useState<Set<ParaCategory>>(
    new Set(PARA_CATEGORIES)
  );

  const getCategoryData = (category: ParaCategory) => {
    if (category === 'Pinned') {
      return data.filter(item => item.isPinned === true);
    }
    return data.filter(item => item.category === category);
  };

  const toggleSection = (category: ParaCategory) => {
    const newExpanded = new Set(expandedSections);
    if (newExpanded.has(category)) {
      newExpanded.delete(category);
    } else {
      newExpanded.add(category);
    }
    setExpandedSections(newExpanded);
  };

  const handleCategoryClick = (category: ParaCategory) => {
    router.push(`/category/${category.toLowerCase()}`);
  };

  const handleItemClick = (item: ParaItem) => {
    router.push(`/item/${item.id}`);
  };

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl font-bold">전체 보기</h2>
          <p className="text-gray-600 mt-1">
            모든 PARA 항목을 한눈에 확인하세요
          </p>
        </div>
      </div>

      <div className="space-y-4">
        <button
          onClick={() => handleCategoryClick('Pinned')}
          className="w-full bg-white border border-gray-200 rounded-lg p-6 hover:shadow-md transition-shadow text-left"
        >
          <div className="flex items-center justify-between">
            <div>
              <h3 className="text-lg font-semibold mb-2">📌 Pinned</h3>
              <p className="text-gray-600">
                자주 사용하는 항목을 여기에 고정하세요
              </p>
            </div>
            <span className="text-gray-400 text-lg font-medium">{getCategoryData('Pinned').length}</span>
          </div>
        </button>

        <button
          onClick={() => handleCategoryClick('Inbox')}
          className="w-full bg-white border border-gray-200 rounded-lg p-6 hover:shadow-md transition-shadow text-left"
        >
          <div className="flex items-center justify-between">
            <div>
              <h3 className="text-lg font-semibold mb-2">📥 Inbox</h3>
              <p className="text-gray-600">
                아직 분류되지 않은 새로운 항목들
              </p>
            </div>
            <span className="text-gray-400 text-lg font-medium">{getCategoryData('Inbox').length}</span>
          </div>
        </button>
      </div>

      <div className="space-y-4">
        {PARA_CATEGORIES.map((category) => {
          const categoryData = getCategoryData(category);
          const isExpanded = expandedSections.has(category);

          return (
            <div key={category} className="bg-white border border-gray-200 rounded-lg overflow-hidden">
              <div className="flex items-center justify-between p-4 border-b border-gray-200 bg-gray-50">
                <div className="flex items-center gap-3">
                  <button
                    onClick={() => toggleSection(category)}
                    className="hover:bg-gray-200 rounded p-1 transition-colors"
                  >
                    {isExpanded ? (
                      <ChevronDown className="size-4" />
                    ) : (
                      <ChevronRight className="size-4" />
                    )}
                  </button>
                  <h3 className="flex items-center gap-2 font-semibold">
                    {category}
                    <span className="text-gray-500 font-normal">
                      {categoryData.length}
                    </span>
                  </h3>
                </div>
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => handleCategoryClick(category)}
                >
                  상세 보기
                </Button>
              </div>

              {isExpanded && categoryData.length > 0 && (
                <div className="overflow-x-auto">
                  <table className="w-full">
                    <thead className="bg-gray-50 border-b border-gray-200">
                      <tr>
                        <th className="px-4 py-3 text-left text-sm font-medium text-gray-600">이름</th>
                        <th className="px-4 py-3 text-left text-sm font-medium text-gray-600"></th>
                        <th className="px-4 py-3 text-left text-sm font-medium text-gray-600">Topic</th>
                        <th className="px-4 py-3 text-left text-sm font-medium text-gray-600">태그</th>
                        <th className="px-4 py-3 text-left text-sm font-medium text-gray-600">기간</th>
                      </tr>
                    </thead>
                    <tbody>
                      {categoryData.map((item) => (
                        <tr
                          key={item.id}
                          onClick={() => handleItemClick(item)}
                          className="border-b border-gray-100 hover:bg-gray-50 cursor-pointer transition-colors"
                        >
                          <td className="px-4 py-3">{item.name}</td>
                          <td className="px-4 py-3">
                            <Badge className={getCategoryColor(item.category)}>
                              {item.category}
                            </Badge>
                          </td>
                          <td className="px-4 py-3">
                            {item.topic && (
                              <Badge variant="outline">{item.topic}</Badge>
                            )}
                          </td>
                          <td className="px-4 py-3">
                            <div className="flex gap-1 flex-wrap">
                              {item.tags.map((tag, idx) => (
                                <Badge key={idx} variant="secondary">
                                  {tag}
                                </Badge>
                              ))}
                            </div>
                          </td>
                          <td className="px-4 py-3 text-gray-600 text-sm">
                            {item.startDate && item.endDate ? (
                              <span>
                                {item.startDate} → {item.endDate}
                              </span>
                            ) : (
                              <span>-</span>
                            )}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}

              {isExpanded && categoryData.length === 0 && (
                <div className="p-8 text-center text-gray-500">
                  항목이 없습니다
                </div>
              )}
            </div>
          );
        })}
      </div>
    </div>
  );
}
