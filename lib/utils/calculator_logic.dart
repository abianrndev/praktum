import 'dart:math' as math;

class CalculatorLogic {
  static double factorial(double n) {
    if (n < 0 || n != n.toInt()) return double.nan;
    if (n <= 1) return 1;
    double result = 1;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }

  static double power(double base, double exponent) {
    return math.pow(base, exponent).toDouble();
  }

  static double squareRoot(double value) {
    if (value < 0) return double.nan;
    return math.sqrt(value);
  }

  static double percentage(double value, double percent) {
    return value * (percent / 100);
  }

  static double sin(double value) {
    return math.sin(value * math.pi / 180);
  }

  static double cos(double value) {
    return math.cos(value * math.pi / 180);
  }

  static double tan(double value) {
    return math.tan(value * math.pi / 180);
  }

  static double log(double value) {
    if (value <= 0) return double.nan;
    return math.log(value);
  }

  static double ln(double value) {
    if (value <= 0) return double.nan;
    return math.log(value) / math.ln10;
  }

  static bool isValidNumber(String value) {
    return double.tryParse(value) != null;
  }

  static String formatNumber(double number) {
    if (number.isNaN) return 'Error';
    if (number.isInfinite) return 'Infinity';

    if (number == number.toInt()) {
      return number.toInt().toString();
    } else {
      return number
          .toStringAsFixed(8)
          .replaceAll(RegExp(r'0*$'), '')
          .replaceAll(RegExp(r'\.$'), '');
    }
  }
}
