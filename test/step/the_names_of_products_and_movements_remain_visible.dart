import 'package:flutter_test/flutter_test.dart';

Future<void> theNamesOfProductsAndMovementsRemainVisible(
    WidgetTester tester) async {
  for (final name in <String>[
    'Cuenta de ahorros',
    'Cuenta secundaria',
    'Nómina recibida',
    'Mercado del mes',
    'Suscripción musical'
  ]) {
    final finder = find.text(name);
    await tester.ensureVisible(finder);
    await tester.pump();
    expect(finder, findsOneWidget);
  }
}
