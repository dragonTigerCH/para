import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:para_note_mobile/src/app.dart';

void main() {
  testWidgets('PARA app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: ParaApp()));

    // Verify that the app renders
    expect(find.byType(Scaffold), findsWidgets);

    // Verify bottom navigation bar exists
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // Verify all 5 navigation items exist
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Projects'), findsOneWidget);
    expect(find.text('Areas'), findsOneWidget);
    expect(find.text('Resources'), findsOneWidget);
    expect(find.text('Archives'), findsOneWidget);
  });

  testWidgets('Bottom navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: ParaApp()));

    // Initially should be on Home screen
    expect(find.text('안녕하세요, 용님 👋'), findsOneWidget);

    // Tap on Projects tab
    await tester.tap(find.text('Projects'));
    await tester.pumpAndSettle();

    // Should show Projects screen
    expect(find.text('프로젝트'), findsOneWidget);

    // Tap on Areas tab
    await tester.tap(find.text('Areas'));
    await tester.pumpAndSettle();

    // Should show Areas screen
    expect(find.text('영역'), findsOneWidget);

    // Tap on Resources tab
    await tester.tap(find.text('Resources'));
    await tester.pumpAndSettle();

    // Should show Resources screen
    expect(find.text('자료'), findsOneWidget);

    // Tap on Archives tab
    await tester.tap(find.text('Archives'));
    await tester.pumpAndSettle();

    // Should show Archives screen
    expect(find.text('보관함'), findsOneWidget);
  });
}
