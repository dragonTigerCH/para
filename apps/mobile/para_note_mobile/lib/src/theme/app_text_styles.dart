import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Title - 22px, Bold
  static const title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Heading - 18px, SemiBold
  static const heading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Subheading - 16px, SemiBold
  static const subheading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body - 15px, Regular
  static const body = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
  );

  // Body Secondary
  static const bodySecondary = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Caption - 13px, Regular
  static const caption = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Small - 11px, Regular
  static const small = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
  );

  // Button Text
  static const button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
