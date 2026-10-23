import 'package:flutter_test/flutter_test.dart';
import '../support/amount_assertions.dart';

Future<void> productAmountsAreMasked(WidgetTester tester) async {
  await assertAmounts(tester, const ['product-amount-0', 'product-amount-1'],
      masked: true);
}
