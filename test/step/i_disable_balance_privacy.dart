import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iDisableBalancePrivacy(WidgetTester tester) async {
  await tester.tap(find.byKey(const ValueKey<String>('privacy-toggle')));
  await tester.pump();
  expect(find.text('Ocultar saldos'), findsOneWidget);
}
