// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:technical_challenge/src/core/constants/app_constants.dart';

void main() {
  testWidgets('App constants are defined correctly', (
    WidgetTester tester,
  ) async {
    // Test that our app constants are properly defined
    expect(AppConstants.appName, 'Technical Challenge');
    expect(AppConstants.appDescription, 'Elegant Hopo Challenge');
    expect(AppConstants.organizationId, 'com.eleganthopo.app');
  });

  testWidgets('Basic MaterialApp widget test', (WidgetTester tester) async {
    // Test a basic MaterialApp widget
    await tester.pumpWidget(
      MaterialApp(
        title: AppConstants.appName,
        home: Scaffold(
          appBar: AppBar(title: const Text('Test App')),
          body: const Center(child: Text('Hello World')),
        ),
      ),
    );

    // Verify that the app loads
    expect(find.text('Test App'), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
  });
}
