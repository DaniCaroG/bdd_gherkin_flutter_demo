import 'package:flutter_test/flutter_test.dart';

Future<void> thePrivacyControlOffersToShowBalances(WidgetTester tester) async {
  expect(find.text('Mostrar saldos'), findsOneWidget);
}
