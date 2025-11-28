import 'package:flutter/material.dart';
import '../../../models/project.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import '../../../widgets/project_card.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String _selectedFilter = '전체';

  // Mock data
  final List<Project> _projects = [
    Project(
      id: '1',
      title: '모바일 앱 UI 디자인',
      description: 'PARA 앱 UI/UX 디자인',
      priority: Priority.high,
      dueDate: DateTime.now().add(const Duration(days: 7)),
      progress: 65,
      tasks: [
        const Task(id: '1', title: 'Task 1', isCompleted: true),
        const Task(id: '2', title: 'Task 2', isCompleted: true),
        const Task(id: '3', title: 'Task 3', isCompleted: false),
      ],
      linkedResourceIds: ['r1', 'r2', 'r3', 'r4', 'r5'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Project(
      id: '2',
      title: 'API 서버 개발',
      description: 'REST API 개발',
      priority: Priority.medium,
      dueDate: DateTime.now().add(const Duration(days: 14)),
      progress: 40,
      tasks: List.generate(
        20,
        (i) => Task(
          id: '$i',
          title: 'Task $i',
          isCompleted: i < 8,
        ),
      ),
      linkedResourceIds: ['r1', 'r2', 'r3'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Project(
      id: '3',
      title: '마케팅 전략 수립',
      description: 'Q1 마케팅 전략',
      priority: Priority.low,
      dueDate: DateTime.now().add(const Duration(days: 30)),
      progress: 20,
      tasks: List.generate(
        15,
        (i) => Task(
          id: '$i',
          title: 'Task $i',
          isCompleted: i < 3,
        ),
      ),
      linkedResourceIds: ['r1', 'r2'],
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
                '프로젝트',
                style: AppTextStyles.title.copyWith(fontSize: 32),
              ),
            ),

            // Filter Bar
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildFilterChip('전체'),
                  const SizedBox(width: 8),
                  _buildFilterChip('진행중'),
                  const SizedBox(width: 8),
                  _buildFilterChip('마감임박'),
                  const SizedBox(width: 8),
                  _buildFilterChip('최신순'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Projects List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    project: _projects[index],
                    onTap: () {
                      // Navigate to project detail
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new project
        },
        child: const Icon(Icons.add),
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
}
