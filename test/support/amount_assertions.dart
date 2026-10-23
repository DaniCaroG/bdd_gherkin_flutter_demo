import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bdd_gherkin_flutter_demo/core/formatters/currency_formatter.dart';
import 'package:bdd_gherkin_flutter_demo/features/balances/domain/models/financial_product.dart';

/// Shared assertions inspect the real rendered Text widgets (not the controller).
const amountKeys = <String>[
  'total-amount',
  'product-amount-0',
  'product-amount-1',
  'movement-amount-0',
  'movement-amount-1',
  'movement-amount-2',
];

String expectedAmount(String key) {
  if (key == 'total-amount')
    return CurrencyFormatter.cop(DemoFinanceData.totalBalance);
  if (key.startsWith('product-amount-')) {
    final index = int.parse(key.split('-').last);
    return CurrencyFormatter.cop(DemoFinanceData.products[index].balance);
  }
  final index = int.parse(key.split('-').last);
  return CurrencyFormatter.cop(DemoFinanceData.movements[index].amount);
}

Future<void> assertAmounts(WidgetTester tester, Iterable<String> keys,
    {required bool masked}) async {
  for (final key in keys) {
    final finder = find.byKey(ValueKey<String>(key));
    await tester.ensureVisible(finder);
    await tester.pump();
    expect(finder, findsOneWidget, reason: 'Missing monetary UI element: $key');
    final text = tester.widget<Text>(finder).data;
    expect(text, masked ? '***' : expectedAmount(key),
        reason: 'Incorrect amount for $key');
  }
}
