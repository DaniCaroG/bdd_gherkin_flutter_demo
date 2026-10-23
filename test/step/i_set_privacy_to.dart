import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSetPrivacyTo(WidgetTester tester, String mode) async {
  if (mode != 'hidden' && mode != 'visible') {
    throw ArgumentError.value(mode, 'mode', 'Expected hidden or visible');
  }
  // A newly pumped NexoApp starts visible; the hidden case taps once.
  if (mode == 'hidden') {
    await tester.tap(find.byKey(const ValueKey<String>('privacy-toggle')));
    await tester.pump();
  }
}
