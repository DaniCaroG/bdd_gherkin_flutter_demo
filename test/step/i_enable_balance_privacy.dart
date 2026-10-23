import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iEnableBalancePrivacy(WidgetTester tester) async {
  await tester.tap(find.byKey(const ValueKey<String>('privacy-toggle')));
  await tester.pump();
  expect(find.text('Mostrar saldos'), findsOneWidget);
}
