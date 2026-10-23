import 'package:flutter/material.dart';

class FinancialProduct {
  const FinancialProduct({
    required this.name,
    required this.detail,
    required this.balance,
    required this.icon,
  });

  final String name;
  final String detail;
  final int balance;
  final IconData icon;
}

class AccountMovement {
  const AccountMovement({
    required this.title,
    required this.detail,
    required this.amount,
    required this.icon,
  });

  final String title;
  final String detail;
  final int amount;
  final IconData icon;
}

abstract class DemoFinanceData {
  static const products = <FinancialProduct>[
    FinancialProduct(
      name: 'Cuenta de ahorros',
      detail: 'Nexo •••• 2841',
      balance: 8250000,
      icon: Icons.savings_outlined,
    ),
    FinancialProduct(
      name: 'Cuenta secundaria',
      detail: 'Nexo •••• 9073',
      balance: 1975000,
      icon: Icons.account_balance_wallet_outlined,
    ),
  ];

  static const movements = <AccountMovement>[
    AccountMovement(
        title: 'Nómina recibida',
        detail: 'Hoy · 09:42',
        amount: 3400000,
        icon: Icons.south_west_rounded),
    AccountMovement(
        title: 'Mercado del mes',
        detail: 'Ayer · 18:05',
        amount: -186500,
        icon: Icons.shopping_bag_outlined),
    AccountMovement(
        title: 'Suscripción musical',
        detail: '17 oct · 08:15',
        amount: -21900,
        icon: Icons.music_note_outlined),
  ];

  static int get totalBalance =>
      products.fold<int>(0, (sum, product) => sum + product.balance);
}
