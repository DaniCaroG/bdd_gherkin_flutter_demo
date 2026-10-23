import 'package:flutter_test/flutter_test.dart';

Future<void> thePrivacyControlOffersToHideBalances(WidgetTester tester) async {
  expect(find.text('Ocultar saldos'), findsOneWidget);
}
