import 'package:flutter_test/flutter_test.dart';
import '../support/amount_assertions.dart';

Future<void> everyDisplayedAmountIsMasked(WidgetTester tester) async {
  await assertAmounts(tester, amountKeys, masked: true);
}
