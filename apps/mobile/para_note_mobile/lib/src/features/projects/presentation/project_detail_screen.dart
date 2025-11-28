import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/providers.dart';

class ProjectDetailScreen extends ConsumerWidget {
  const ProjectDetailScreen({required this.projectId, super.key});

  static const routeName = 'project-detail';

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final project = ref.watch(projectDetailProvider(projectId));

    return Scaffold(
      appBar: AppBar(title: const Text('Project Detail')),
      body: project.when(
        data: (project) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text('Status: ${project.status.name}'),
              const SizedBox(height: 8),
              Text('Due: ${project.targetDate.value}'),
              const SizedBox(height: 16),
              Text(project.description ?? 'No description provided.'),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Failed to load project: $error'),
        ),
      ),
    );
  }
}
