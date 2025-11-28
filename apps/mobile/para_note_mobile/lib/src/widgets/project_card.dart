import 'package:flutter/material.dart';
import '../models/project.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'progress_bar.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final VoidCallback? onTap;

  const ProjectCard({
    super.key,
    required this.project,
    this.onTap,
  });

  Color get _priorityColor {
    switch (project.priority) {
      case Priority.high:
        return AppColors.priorityHigh;
      case Priority.medium:
        return AppColors.priorityMedium;
      case Priority.low:
        return AppColors.priorityLow;
    }
  }

  Color get _priorityBgColor {
    switch (project.priority) {
      case Priority.high:
        return AppColors.priorityHighBg;
      case Priority.medium:
        return AppColors.priorityMediumBg;
      case Priority.low:
        return AppColors.priorityLowBg;
    }
  }

  String get _priorityText {
    switch (project.priority) {
      case Priority.high:
        return '긴급';
      case Priority.medium:
        return '보통';
      case Priority.low:
        return '낮음';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: BorderSide(
                color: _priorityColor,
                width: 4,
              ),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with priority badge and title
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _priorityBgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      _priorityText,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: _priorityColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      project.title,
                      style: AppTextStyles.subheading,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Progress bar
              ProgressBar(
                progress: project.calculatedProgress,
                color: _priorityColor,
              ),
              const SizedBox(height: 8),

              // Meta information
              Row(
                children: [
                  if (project.dueDate != null) ...[
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: project.daysUntilDue < 3
                          ? AppColors.error
                          : AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      project.daysUntilDueText,
                      style: TextStyle(
                        fontSize: 13,
                        color: project.daysUntilDue < 3
                            ? AppColors.error
                            : AppColors.textSecondary,
                        fontWeight: project.daysUntilDue < 3
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                  const Icon(
                    Icons.attach_file,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${project.linkedResourceIds.length}개 첨부',
                    style: AppTextStyles.caption,
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.check_circle_outline,
                    size: 14,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${project.completedTasksCount}/${project.totalTasksCount}',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
