abstract class CurrencyFormatter {
  /// Values are represented as integer COP, without a currency package.
  static String cop(int amount) {
    final negative = amount < 0;
    final digits = amount.abs().toString();
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) buffer.write('.');
      buffer.write(digits[i]);
    }
    return '${negative ? '-' : ''}\$${buffer.toString()}';
  }
}
