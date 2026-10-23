import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../widgets/keyword_tile.dart';

class GherkinGuidePage extends StatelessWidget {
  const GherkinGuidePage({super.key});
  static const _example = '''Feature: Privacidad de los saldos de Nexo
  Scenario: Ocultar todos los importes
    Given the Nexo dashboard is open
    When I enable balance privacy
    Then every displayed amount is masked
    And the privacy control offers to show balances''';
  static const _outline = '''Scenario Outline: Alternar privacidad
  Given the Nexo dashboard is open
  When I set privacy to <mode>
  Then the total amount is <result>

  Examples:
    | mode      | result  |
    | {'hidden'} | {'masked'} |
    | {'visible'}| {'visible'} |''';

  @override
  Widget build(BuildContext context) => SafeArea(
          child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 26, 22, 28),
        children: [
          const Text('APRENDE CON NEXO',
              style: TextStyle(
                  fontSize: 11,
                  color: AppColors.muted,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2)),
          const SizedBox(height: 9),
          const Text('Gherkin, en lenguaje humano.',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                  color: AppColors.ink)),
          const SizedBox(height: 12),
          const Text(
              'Describimos lo que una persona espera observar; después conectamos esa historia con una prueba de Flutter.',
              style:
                  TextStyle(fontSize: 14, height: 1.5, color: AppColors.muted)),
          const SizedBox(height: 25),
          const Text('El vocabulario',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          const KeywordTile(
              keyword: 'Feature',
              description:
                  'Capacidad de negocio: proteger los saldos de Nexo.'),
          const KeywordTile(
              keyword: 'Scenario',
              description: 'Un ejemplo concreto de comportamiento observable.'),
          const KeywordTile(
              keyword: 'Given',
              description: 'Contexto inicial: el panel de Nexo está abierto.'),
          const KeywordTile(
              keyword: 'When',
              description: 'Acción: activar o desactivar la privacidad.'),
          const KeywordTile(
              keyword: 'Then',
              description:
                  'Resultado verificable: los importes están ocultos o visibles.'),
          const KeywordTile(
              keyword: 'And',
              description:
                  'Añade una condición o comprobación del mismo tipo.'),
          const KeywordTile(
              keyword: 'But',
              description:
                  'Expresa una excepción o contraste. No cambia la ejecución del paso.'),
          const KeywordTile(
              keyword: 'Scenario Outline',
              description:
                  'Plantilla de escenario que se ejecuta por cada fila de Examples.'),
          const KeywordTile(
              keyword: 'Examples',
              description: 'Tabla de valores que alimenta Scenario Outline.'),
          const SizedBox(height: 23),
          const Text('Un escenario real',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          const Text('test/features/balances/balances.feature',
              style: TextStyle(fontSize: 11, color: AppColors.muted)),
          const SizedBox(height: 10),
          const _CodePanel(source: _example),
          const SizedBox(height: 22),
          const Text('Una plantilla real',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          const _CodePanel(source: _outline),
        ],
      ));
}

class _CodePanel extends StatelessWidget {
  const _CodePanel({required this.source});
  final String source;
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: AppColors.navy, borderRadius: BorderRadius.circular(20)),
        child: SelectableText(source,
            style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 11.4,
                color: Color(0xFFE4F8F3),
                height: 1.65)),
      );
}
