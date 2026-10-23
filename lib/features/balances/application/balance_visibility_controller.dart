import 'package:flutter/foundation.dart';
import '../../../core/formatters/currency_formatter.dart';

/// A single in-memory source of truth for ALL displayed monetary amounts.
class BalanceVisibilityController extends ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  void toggle() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  String displayAmount(int amount) =>
      _isVisible ? CurrencyFormatter.cop(amount) : '***';
}
