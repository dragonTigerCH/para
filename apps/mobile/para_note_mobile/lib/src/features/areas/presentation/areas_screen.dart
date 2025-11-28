import 'package:flutter/material.dart';
import '../../../models/area.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../../widgets/area_card.dart';

class AreasScreen extends StatefulWidget {
  const AreasScreen({super.key});

  @override
  State<AreasScreen> createState() => _AreasScreenState();
}

class _AreasScreenState extends State<AreasScreen> {
  String _selectedCategory = '전체';

  // Mock data
  final List<Area> _areas = [
    Area(
      id: '1',
      title: '건강관리',
      icon: '💪',
      description: '운동 및 건강',
      category: '건강',
      metrics: const Metrics(
        type: MetricType.stars,
        current: 5,
        target: 5,
      ),
      habits: const [
        Habit(id: '1', title: '아침 운동', isCompletedToday: true),
        Habit(id: '2', title: '물 마시기', isCompletedToday: true),
      ],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Area(
      id: '2',
      title: '재무관리',
      icon: '💰',
      description: '예산 관리',
      category: '재무',
      metrics: const Metrics(
        type: MetricType.progress,
        current: 85,
        target: 100,
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Area(
      id: '3',
      title: '학습',
      icon: '📚',
      description: '지속적 학습',
      category: '학습',
      metrics: const Metrics(
        type: MetricType.stars,
        current: 4,
        target: 5,
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Area(
      id: '4',
      title: '커리어',
      icon: '💼',
      description: '경력 개발',
      category: '커리어',
      metrics: const Metrics(
        type: MetricType.progress,
        current: 70,
        target: 100,
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Area(
      id: '5',
      title: '관계',
      icon: '❤️',
      description: '인간관계',
      category: '관계',
      metrics: const Metrics(
        type: MetricType.stars,
        current: 5,
        target: 5,
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Area(
      id: '6',
      title: '가정',
      icon: '🏠',
      description: '가정 관리',
      category: '가정',
      metrics: const Metrics(
        type: MetricType.stars,
        current: 4,
        target: 5,
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
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
                '영역',
                style: AppTextStyles.title.copyWith(fontSize: 32),
              ),
            ),

            // Category Filter
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildFilterChip('전체'),
                  const SizedBox(width: 8),
                  _buildFilterChip('건강'),
                  const SizedBox(width: 8),
                  _buildFilterChip('재무'),
                  const SizedBox(width: 8),
                  _buildFilterChip('커리어'),
                  const SizedBox(width: 8),
                  _buildFilterChip('관계'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Areas Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemCount: _areas.length,
                itemBuilder: (context, index) {
                  return AreaCard(
                    area: _areas[index],
                    onTap: () {
                      // Navigate to area detail
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
    final isSelected = _selectedCategory == label;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = label;
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
}
