import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../application/balance_visibility_controller.dart';
import '../../domain/models/financial_product.dart';
import '../widgets/amount_text.dart';
import '../widgets/finance_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.controller});
  final BalanceVisibilityController controller;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: controller,
        builder: (context, _) => SafeArea(
            child: LayoutBuilder(
          builder: (context, constraints) => ListView(
            padding: const EdgeInsets.fromLTRB(22, 24, 22, 24),
            children: [
              Row(children: [
                Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        color: AppColors.navy,
                        borderRadius: BorderRadius.circular(14)),
                    child: const Icon(Icons.layers_rounded,
                        color: AppColors.teal)),
                const SizedBox(width: 11),
                const Text('nexo',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.3,
                        color: AppColors.navy)),
                const Spacer(),
                const Chip(
                    label: Text('DEMO · BDD',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w700))),
              ]),
              const SizedBox(height: 31),
              const Text('Hola, Daniel 👋',
                  style: TextStyle(color: AppColors.muted, fontSize: 15)),
              const SizedBox(height: 5),
              const Text('Tu dinero, a tu manera.',
                  style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 23,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color(0xFF192C50), Color(0xFF0E1A35)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 24,
                        offset: const Offset(0, 12))
                  ],
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        const Expanded(
                            child: Text('SALDO TOTAL',
                                style: TextStyle(
                                    color: Color(0xFFB6C6DC),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.5))),
                        TextButton.icon(
                          key: const ValueKey('privacy-toggle'),
                          onPressed: controller.toggle,
                          icon: Icon(
                              controller.isVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 18,
                              color: Colors.white),
                          label: Text(
                              controller.isVisible
                                  ? 'Ocultar saldos'
                                  : 'Mostrar saldos',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
                        ),
                      ]),
                      const SizedBox(height: 14),
                      AmountText(
                          amount: DemoFinanceData.totalBalance,
                          controller: controller,
                          amountKey: 'total-amount',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth < 340 ? 30 : 37,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1.2)),
                      const SizedBox(height: 24),
                      const Row(children: [
                        Icon(Icons.shield_outlined,
                            color: AppColors.teal, size: 17),
                        SizedBox(width: 7),
                        Text('Controla lo que se muestra',
                            style: TextStyle(
                                color: Color(0xFFBDCEDD), fontSize: 12)),
                      ]),
                    ]),
              ),
              const SizedBox(height: 29),
              const _SectionHeading(
                  title: 'Mis productos',
                  subtitle: 'Tus cuentas en un solo lugar'),
              const SizedBox(height: 14),
              ...DemoFinanceData.products
                  .asMap()
                  .entries
                  .map((entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: FinanceCard(
                            product: entry.value,
                            index: entry.key,
                            controller: controller),
                      )),
              const SizedBox(height: 18),
              const _SectionHeading(
                  title: 'Movimientos recientes',
                  subtitle: 'Lo último en tus cuentas'),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: AppColors.line)),
                child: Column(children: [
                  for (var i = 0;
                      i < DemoFinanceData.movements.length;
                      i++) ...[
                    if (i > 0)
                      const Divider(
                          height: 1, indent: 70, color: AppColors.line),
                    _MovementRow(
                        movement: DemoFinanceData.movements[i],
                        index: i,
                        controller: controller),
                  ],
                ]),
              ),
            ],
          ),
        )),
      );
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) => Row(children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(fontSize: 12, color: AppColors.muted)),
        ])),
      ]);
}

class _MovementRow extends StatelessWidget {
  const _MovementRow(
      {required this.movement, required this.index, required this.controller});
  final AccountMovement movement;
  final int index;
  final BalanceVisibilityController controller;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        child: Row(children: [
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: AppColors.canvas,
                  borderRadius: BorderRadius.circular(13)),
              child: Icon(movement.icon, size: 19, color: AppColors.navy)),
          const SizedBox(width: 13),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(movement.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 13)),
                const SizedBox(height: 3),
                Text(movement.detail,
                    style:
                        const TextStyle(color: AppColors.muted, fontSize: 11)),
              ])),
          const SizedBox(width: 5),
          AmountText(
              amount: movement.amount,
              controller: controller,
              amountKey: 'movement-amount-$index',
              style: TextStyle(
                  color: movement.amount > 0
                      ? const Color(0xFF078673)
                      : AppColors.ink,
                  fontWeight: FontWeight.w800,
                  fontSize: 13)),
        ]),
      );
}
