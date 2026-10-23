import 'package:flutter/material.dart';
import '../features/balances/application/balance_visibility_controller.dart';
import '../features/balances/presentation/pages/dashboard_page.dart';
import '../features/gherkin_guide/presentation/pages/gherkin_guide_page.dart';
import 'theme/app_theme.dart';

class NexoApp extends StatefulWidget {
  const NexoApp({super.key});

  @override
  State<NexoApp> createState() => _NexoAppState();
}

class _NexoAppState extends State<NexoApp> {
  final BalanceVisibilityController _visibility = BalanceVisibilityController();
  int _index = 0;

  @override
  void dispose() {
    _visibility.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexo · Demo BDD',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: Scaffold(
        body: IndexedStack(
          index: _index,
          children: [
            DashboardPage(controller: _visibility),
            const GherkinGuidePage(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (index) => setState(() => _index = index),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.account_balance_wallet_outlined),
                selectedIcon: Icon(Icons.account_balance_wallet_rounded),
                label: 'Inicio'),
            NavigationDestination(
                icon: Icon(Icons.menu_book_outlined),
                selectedIcon: Icon(Icons.menu_book_rounded),
                label: 'Guía Gherkin'),
          ],
        ),
      ),
    );
  }
}
