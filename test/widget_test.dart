import 'package:flutter_test/flutter_test.dart';
import 'package:campus_info_app/main.dart';

void main() {
  testWidgets('CampusApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CampusApp());
    expect(find.text('Civitas Campus Info'), findsOneWidget);
  });
}