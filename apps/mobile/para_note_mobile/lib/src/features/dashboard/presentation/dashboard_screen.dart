import 'package:domain_models/domain_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../application/providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  static const routeName = 'dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectListProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Dashboard')),
        body: projects.when(
          data: (items) => ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final project = items[index];
              return _ProjectCard(project: project);
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text('Failed to load projects: $error'),
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(project.title),
        subtitle: Text(
          'Due ${project.targetDate.value} · Progress ${project.progress.value}%',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/projects/${project.id.value}'),
      ),
    );
  }
}
