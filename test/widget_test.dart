import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Navigate to profile page test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: AboutPage()));

    // Verify the initial screen shows "Welcome" text.
    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('To Celine Profile'), findsOneWidget);
    expect(find.text('Explore!'), findsOneWidget);

    // Tap the 'Explore!' button and trigger a frame.
    await tester.tap(find.text('Explore!'));
    await tester.pumpAndSettle();

    // Verify that it navigates to the profile page.
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('I\'m Celine Auriel'), findsOneWidget);
    expect(find.text('Information System | ITS'), findsOneWidget);
  });
}
