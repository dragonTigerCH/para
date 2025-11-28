import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/projects/presentation/projects_screen.dart';
import 'features/areas/presentation/areas_screen.dart';
import 'features/resources/presentation/resources_screen.dart';
import 'features/archives/presentation/archives_screen.dart';

class ParaApp extends StatelessWidget {
  const ParaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PARA',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MainNavigationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ProjectsScreen(),
    AreasScreen(),
    ResourcesScreen(),
    ArchivesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Areas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archives',
          ),
        ],
      ),
    );
  }
}
