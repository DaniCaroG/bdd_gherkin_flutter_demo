import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bdd_gherkin_flutter_demo/app/nexo_app.dart';

Future<void> theNexoDashboardIsOpen(WidgetTester tester) async {
  await tester.binding.setSurfaceSize(const Size(450, 1800));
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(const NexoApp());
  await tester.pump();
  expect(find.text('nexo'), findsOneWidget);
  expect(find.byKey(const ValueKey<String>('privacy-toggle')), findsOneWidget);
}
