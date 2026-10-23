# Nexo — BDD + Gherkin en Flutter

Demo fintech **totalmente ficticia**, en español y sin backend, para explicar cómo una especificación Gherkin se conecta con pruebas automatizadas de widgets Flutter. UI Material 3 con navegación Inicio / Guía Gherkin.

## Funcionalidad

- Balance total COP, cuenta de ahorros, cuenta secundaria y tres movimientos simulados.
- Privacidad reversible y repetible. Un único `BalanceVisibilityController` hace que los **6** valores monetarios se muestren como `***` o se restauren exactamente.
- Pantalla educativa con palabras clave Gherkin y ejemplos correspondientes al `.feature` real.
- Cuatro escenarios más un Scenario Outline con dos filas: tests de widgets derivados por generación y definiciones manuales en `test/step/`.

## Inicio rápido en Mac con Flutter 3.10.6

```bash
cd /ruta/bdd_gherkin_flutter_demo
flutter create --platforms=android,ios --project-name bdd_gherkin_flutter_demo .
flutter pub get
dart run build_runner build
flutter analyze
flutter test
flutter run
```

**Importante:** respalda el código antes de `flutter create`, comprueba su diff y conserva los archivos de esta entrega. Como alternativa más segura, genera las plataformas en un proyecto separado y copia `android/` y `ios/`. Guía completa: [docs/primera_ejecucion.md](docs/primera_ejecucion.md).

## Compatibilidad y estado de validación

Objetivo: **Flutter 3.10.6 / Dart 3.0.6**, `sdk: '>=3.0.0 <4.0.0'`. Versiones exactas de desarrollo: `bdd_widget_test: 2.0.1`, `build_runner: 2.4.9`. En Pub.dev ambas versiones declaran un mínimo de Dart compatible con 3.0; las versiones recientes de `bdd_widget_test` ya piden Dart 3.7. **No se ha ejecutado un solver de dependencias ni compilación/pruebas/análisis**: faltan Flutter y Dart en el sistema donde se creó la entrega. Posibles incompatibilidades transitivas se verifican en la Mac ejecutando `flutter pub get`.

Referencia: [bdd_widget_test 2.0.1](https://pub.dev/packages/bdd_widget_test/versions/2.0.1), [build_runner 2.4.9](https://pub.dev/packages/build_runner/versions/2.4.9), [documentación del generador](https://pub.dev/packages/bdd_widget_test/versions/2.0.1).

## Estructura y responsabilidades

```text
lib/
  app/                 # aplicación, navegación y tema
  core/formatters/     # COP sin paquetes externos
  features/balances/   # modelos, estado, página y widgets
  features/gherkin_guide/ # página educativa y componente de glosario
test/
  features/balances/balances.feature # especificación fuente
  step/                # pasos Dart reales que el generador reutiliza
  support/             # aserciones de importes renderizados
docs/                  # charla y primera ejecución
```

`build.yaml` configura el generador. El `.feature` es la fuente de los tests derivados: **no modifiques el test Dart generado**. Los steps se definen fuera de los archivos generados y las aserciones examinan el `Text` real por clave. Cada escenario monta una aplicación independiente.

## Material para exposición

- [Guion y teoría de BDD/Gherkin](docs/charla_bdd_gherkin.md)
- [Primera ejecución, generación y validación](docs/primera_ejecucion.md)

No contiene Maestro ni Supertest, autenticación, pagos, redes ni persistencia.
