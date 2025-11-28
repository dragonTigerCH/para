import 'package:flutter/material.dart';
import '../../../models/resource.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../../widgets/resource_card.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  String _selectedFilter = '전체';
  final TextEditingController _searchController = TextEditingController();

  // Mock data
  final List<Resource> _resources = [
    Resource(
      id: '1',
      title: '디자인 시스템 가이드',
      type: ResourceType.document,
      content: 'https://example.com/design-guide',
      tags: ['디자인', 'UI'],
      createdAt: DateTime.now(),
      accessedAt: DateTime.now(),
    ),
    Resource(
      id: '2',
      title: '컬러 팔레트 모음',
      type: ResourceType.image,
      content: 'https://example.com/colors',
      tags: ['디자인'],
      createdAt: DateTime.now(),
      accessedAt: DateTime.now(),
    ),
    Resource(
      id: '3',
      title: 'React 베스트 프랙티스',
      type: ResourceType.link,
      content: 'https://example.com/react',
      tags: ['개발', 'React'],
      createdAt: DateTime.now(),
      accessedAt: DateTime.now(),
    ),
    Resource(
      id: '4',
      title: '마케팅 분석 리포트',
      type: ResourceType.document,
      content: 'https://example.com/marketing',
      tags: ['마케팅'],
      createdAt: DateTime.now(),
      accessedAt: DateTime.now(),
    ),
    Resource(
      id: '5',
      title: '유용한 개발 도구',
      type: ResourceType.link,
      content: 'https://example.com/tools',
      tags: ['개발', '도구'],
      createdAt: DateTime.now(),
      accessedAt: DateTime.now(),
    ),
    Resource(
      id: '6',
      title: '아이디어 스케치',
      type: ResourceType.note,
      content: '프로젝트 아이디어',
      tags: ['아이디어'],
      createdAt: DateTime.now(),
      accessedAt: DateTime.now(),
    ),
  ];

  final List<String> _popularTags = [
    '디자인',
    '개발',
    '마케팅',
    '레퍼런스',
    '아이디어',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '자료',
                style: AppTextStyles.title.copyWith(fontSize: 32),
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: '자료 검색...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tag Cloud
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _popularTags.map((tag) {
                  return InkWell(
                    onTap: () {
                      // Filter by tag
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.resourcesColor),
                      ),
                      child: Text(
                        '#$tag',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.resourcesColor,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            // Filter Bar
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildFilterChip('전체'),
                  const SizedBox(width: 8),
                  _buildFilterChip('문서'),
                  const SizedBox(width: 8),
                  _buildFilterChip('링크'),
                  const SizedBox(width: 8),
                  _buildFilterChip('이미지'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Resources Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemCount: _resources.length,
                itemBuilder: (context, index) {
                  return ResourceCard(
                    resource: _resources[index],
                    onTap: () {
                      // Navigate to resource detail
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = _selectedFilter == label;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedFilter = label;
        });
      },
      backgroundColor: Colors.white,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(
        fontSize: 14,
        color: isSelected ? Colors.white : AppColors.textPrimary,
      ),
      side: BorderSide(
        color: isSelected ? AppColors.primary : AppColors.border,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
