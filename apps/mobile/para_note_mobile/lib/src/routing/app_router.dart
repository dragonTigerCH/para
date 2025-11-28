import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/inbox/presentation/inbox_screen.dart';
import '../features/projects/presentation/project_detail_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/dashboard',
    routes: [
      ShellRoute(
        builder: (context, state, child) => HomeShell(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            name: DashboardScreen.routeName,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DashboardScreen(),
            ),
          ),
          GoRoute(
            path: '/inbox',
            name: InboxScreen.routeName,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: InboxScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/projects/:id',
        name: ProjectDetailScreen.routeName,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProjectDetailScreen(projectId: id);
        },
      ),
    ],
  );
});

class HomeShell extends StatelessWidget {
  const HomeShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final index = switch (location) {
      '/dashboard' => 0,
      '/inbox' => 1,
      _ => 0,
    };

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.inbox_outlined),
            selectedIcon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
        ],
        onDestinationSelected: (value) {
          switch (value) {
            case 0:
              context.go('/dashboard');
              break;
            case 1:
              context.go('/inbox');
              break;
          }
        },
      ),
    );
  }
}
