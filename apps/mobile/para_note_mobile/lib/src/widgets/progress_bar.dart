import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ProgressBar extends StatelessWidget {
  final double progress; // 0-100
  final Color? color;
  final double height;

  const ProgressBar({
    super.key,
    required this.progress,
    this.color,
    this.height = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: (progress / 100).clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: color ?? AppColors.primary,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}
