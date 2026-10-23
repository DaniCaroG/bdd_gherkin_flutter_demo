import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../application/balance_visibility_controller.dart';
import '../../domain/models/financial_product.dart';
import 'amount_text.dart';

class FinanceCard extends StatelessWidget {
  const FinanceCard(
      {super.key,
      required this.product,
      required this.index,
      required this.controller});
  final FinancialProduct product;
  final int index;
  final BalanceVisibilityController controller;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.line)),
        child: Row(children: [
          Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                  color: AppColors.mint,
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(product.icon, color: AppColors.navy)),
          const SizedBox(width: 14),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(product.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 14)),
                const SizedBox(height: 4),
                Text(product.detail,
                    style:
                        const TextStyle(color: AppColors.muted, fontSize: 12)),
              ])),
          const SizedBox(width: 6),
          AmountText(
              amount: product.balance,
              controller: controller,
              amountKey: 'product-amount-$index',
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                  color: AppColors.ink)),
        ]),
      );
}
