import 'package:flutter/material.dart';
import '../models/resource.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class ResourceCard extends StatelessWidget {
  final Resource resource;
  final VoidCallback? onTap;

  const ResourceCard({
    super.key,
    required this.resource,
    this.onTap,
  });

  Color get _thumbnailColor {
    // Generate color based on resource type
    switch (resource.type) {
      case ResourceType.document:
        return const Color(0xFF667eea);
      case ResourceType.link:
        return const Color(0xFF4facfe);
      case ResourceType.image:
        return const Color(0xFFf093fb);
      case ResourceType.video:
        return const Color(0xFF43e97b);
      case ResourceType.note:
        return const Color(0xFFfa709a);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _thumbnailColor,
                    _thumbnailColor.withValues(alpha: 0.7),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  resource.typeIcon,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),

            // Info
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resource.title,
                    style: AppTextStyles.subheading.copyWith(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  if (resource.tags.isNotEmpty)
                    Text(
                      resource.tags.map((tag) => '#$tag').join(' '),
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.resourcesColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
