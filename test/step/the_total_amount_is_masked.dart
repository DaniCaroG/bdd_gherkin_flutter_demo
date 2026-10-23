import 'package:flutter_test/flutter_test.dart';
import '../support/amount_assertions.dart';

Future<void> theTotalAmountIsMasked(WidgetTester tester) async {
  await assertAmounts(tester, const ['total-amount'], masked: true);
}
