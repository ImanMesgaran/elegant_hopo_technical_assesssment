import 'package:flutter_test/flutter_test.dart';

import 'package:elegant_hopo_technical_assessment/main.dart';

void main() {
  testWidgets('App loads and shows home page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ElegantHopoApp());

    // Verify that our app loads and shows the home page
    expect(find.text('Elegant Hopo Technical Assessment'), findsOneWidget);
    expect(find.text('Clean Architecture Flutter App'), findsOneWidget);
  });
}
