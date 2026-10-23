import 'package:flutter_test/flutter_test.dart';
import '../support/amount_assertions.dart';

Future<void> theTotalAmountIs(WidgetTester tester, String result) async {
  if (result != 'masked' && result != 'visible') {
    throw ArgumentError.value(result, 'result', 'Expected masked or visible');
  }
  await assertAmounts(tester, const ['total-amount'],
      masked: result == 'masked');
}
