import 'package:bdd_gherkin_flutter_demo/app/nexo_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'oculta y recupera los saldos',
    (WidgetTester tester) async {
      await tester.pumpWidget(const NexoApp());

      // Inicialmente, los saldos están visibles.
      expect(find.text('Ocultar saldos'), findsOneWidget);

      // El usuario activa la privacidad.
      await tester.tap(find.text('Ocultar saldos'));
      await tester.pumpAndSettle();

      // El control debe permitir mostrar los saldos.
      expect(find.text('Mostrar saldos'), findsOneWidget);
      expect(find.text('***'), findsWidgets);

      // El usuario vuelve a mostrar los saldos.
      await tester.tap(find.text('Mostrar saldos'));
      await tester.pumpAndSettle();

      expect(find.text('Ocultar saldos'), findsOneWidget);
      expect(find.text('***'), findsNothing);
    },
  );
}