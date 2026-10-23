import 'package:flutter/material.dart';
import '../../application/balance_visibility_controller.dart';

class AmountText extends StatelessWidget {
  const AmountText(
      {super.key,
      required this.amount,
      required this.controller,
      this.style,
      required this.amountKey});

  final int amount;
  final BalanceVisibilityController controller;
  final TextStyle? style;
  final String amountKey;

  @override
  Widget build(BuildContext context) => Text(
        controller.displayAmount(amount),
        key: ValueKey<String>(amountKey),
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
