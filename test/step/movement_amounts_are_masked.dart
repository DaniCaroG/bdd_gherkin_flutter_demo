import 'package:flutter_test/flutter_test.dart';
import '../support/amount_assertions.dart';

Future<void> movementAmountsAreMasked(WidgetTester tester) async {
  await assertAmounts(tester,
      const ['movement-amount-0', 'movement-amount-1', 'movement-amount-2'],
      masked: true);
}
