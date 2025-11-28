import 'package:flutter/material.dart';
import '../models/area.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'progress_bar.dart';

class AreaCard extends StatelessWidget {
  final Area area;
  final VoidCallback? onTap;

  const AreaCard({
    super.key,
    required this.area,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Text(
                area.icon,
                style: const TextStyle(fontSize: 48),
              ),
              const SizedBox(height: 12),

              // Title
              Text(
                area.title,
                style: AppTextStyles.subheading,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              // Metrics
              if (area.metrics.type == MetricType.progress) ...[
                Text(
                  '${area.metrics.current.toInt()}/${area.metrics.target.toInt()}',
                  style: AppTextStyles.caption,
                ),
                const SizedBox(height: 8),
                ProgressBar(
                  progress: area.progressPercentage,
                  color: AppColors.areasColor,
                ),
              ] else if (area.metrics.type == MetricType.stars) ...[
                Text(
                  area.category,
                  style: AppTextStyles.caption,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < area.starRating
                          ? Icons.star
                          : Icons.star_border,
                      color: AppColors.resourcesColor,
                      size: 18,
                    ),
                  ),
                ),
              ] else ...[
                Text(
                  '${area.metrics.current.toInt()}개',
                  style: AppTextStyles.caption,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
