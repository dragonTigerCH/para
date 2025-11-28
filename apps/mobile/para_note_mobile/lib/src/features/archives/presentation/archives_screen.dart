import 'package:flutter/material.dart';
import '../../../models/archive.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class ArchivesScreen extends StatelessWidget {
  const ArchivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data
    final archives = _getMockArchives();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '보관함',
                  style: AppTextStyles.title.copyWith(fontSize: 32),
                ),
              ),

              // Statistics Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '이번 달 완료',
                                    style: AppTextStyles.caption,
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    '12',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.archivesColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '전체 보관',
                                    style: AppTextStyles.caption,
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    '156',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.archivesColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Timeline
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2024
                    Text(
                      '2024',
                      style: AppTextStyles.heading.copyWith(
                        color: AppColors.archivesColor,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // December
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12월',
                            style: AppTextStyles.subheading.copyWith(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...archives
                              .where((a) =>
                                  a.archivedAt.month == 12 &&
                                  a.archivedAt.year == 2024)
                              .map((archive) => _buildArchiveCard(archive)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // November
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '11월',
                            style: AppTextStyles.subheading.copyWith(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...archives
                              .where((a) =>
                                  a.archivedAt.month == 11 &&
                                  a.archivedAt.year == 2024)
                              .map((archive) => _buildArchiveCard(archive)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArchiveCard(Archive archive) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8, left: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Icon
            Text(
              archive.typeIcon,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    archive.title,
                    style: AppTextStyles.subheading.copyWith(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${archive.archivedAt.year}.${archive.archivedAt.month.toString().padLeft(2, '0')}.${archive.archivedAt.day.toString().padLeft(2, '0')}',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textTertiary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Archive> _getMockArchives() {
    return [
      Archive(
        id: '1',
        originalType: ArchiveType.project,
        originalId: 'p1',
        title: '완료된 프로젝트 A',
        description: '성공적으로 완료됨',
        archivedAt: DateTime(2024, 12, 15),
      ),
      Archive(
        id: '2',
        originalType: ArchiveType.resource,
        originalId: 'r1',
        title: '보관된 노트 B',
        description: '참고 자료',
        archivedAt: DateTime(2024, 12, 10),
      ),
      Archive(
        id: '3',
        originalType: ArchiveType.project,
        originalId: 'p2',
        title: '웹사이트 리뉴얼',
        description: '완료',
        archivedAt: DateTime(2024, 11, 28),
      ),
      Archive(
        id: '4',
        originalType: ArchiveType.project,
        originalId: 'p3',
        title: 'Q4 마케팅 캠페인',
        description: '성공',
        archivedAt: DateTime(2024, 11, 15),
      ),
      Archive(
        id: '5',
        originalType: ArchiveType.resource,
        originalId: 'r2',
        title: '연구 자료 모음',
        description: '보관',
        archivedAt: DateTime(2024, 11, 5),
      ),
    ];
  }
}
