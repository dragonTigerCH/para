import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../../widgets/metric_card.dart';
import '../../../widgets/progress_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                '안녕하세요, 용님 👋',
                style: AppTextStyles.title.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 4),
              Text(
                _formatDate(DateTime.now()),
                style: AppTextStyles.bodySecondary,
              ),
              const SizedBox(height: 24),

              // Metrics Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: const [
                  MetricCard(
                    title: '진행중 프로젝트',
                    value: '12',
                    color: AppColors.projectsColor,
                  ),
                  MetricCard(
                    title: '관리중 영역',
                    value: '8',
                    color: AppColors.areasColor,
                  ),
                  MetricCard(
                    title: '저장된 자료',
                    value: '45',
                    color: AppColors.resourcesColor,
                  ),
                  MetricCard(
                    title: '완료한 작업',
                    value: '23',
                    color: AppColors.archivesColor,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Today's Focus Section
              Text(
                '오늘의 포커스 🎯',
                style: AppTextStyles.heading,
              ),
              const SizedBox(height: 16),

              // Focus Cards
              _buildFocusCard(
                title: '모바일 앱 UI 디자인',
                progress: 65,
                daysLeft: 7,
              ),
              const SizedBox(height: 12),
              _buildFocusCard(
                title: 'API 서버 개발',
                progress: 40,
                daysLeft: 14,
              ),
              const SizedBox(height: 12),
              _buildFocusCard(
                title: '데이터베이스 설계',
                progress: 85,
                daysLeft: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFocusCard({
    required String title,
    required int progress,
    required int daysLeft,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.subheading,
            ),
            const SizedBox(height: 8),
            ProgressBar(progress: progress.toDouble()),
            const SizedBox(height: 8),
            Text(
              '📅 D-$daysLeft',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const weekdays = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
    final weekday = weekdays[date.weekday - 1];
    return '${date.year}년 ${date.month}월 ${date.day}일 $weekday';
  }
}
