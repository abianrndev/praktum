class CalculatorModel {
  String _display = '0';
  String _previousValue = '';
  String _operation = '';
  bool _waitingForOperand = false;
  bool _hasDecimal = false;
  List<String> _history = [];

  String get display => _display;
  List<String> get history => _history;
  bool get waitingForOperand => _waitingForOperand;

  void clear() {
    _display = '0';
    _previousValue = '';
    _operation = '';
    _waitingForOperand = false;
    _hasDecimal = false;
  }

  void clearEntry() {
    _display = '0';
    _waitingForOperand = false;
    _hasDecimal = false;
  }

  void addToHistory(String calculation) {
    _history.insert(0, calculation);
    if (_history.length > 50) {
      _history.removeLast();
    }
  }

  void clearHistory() {
    _history.clear();
  }

  void inputDigit(String digit) {
    if (_waitingForOperand) {
      _display = digit;
      _waitingForOperand = false;
      _hasDecimal = false;
    } else {
      _display = _display == '0' ? digit : _display + digit;
    }
  }

  void inputDecimal() {
    if (_waitingForOperand) {
      _display = '0.';
      _waitingForOperand = false;
      _hasDecimal = true;
    } else if (!_hasDecimal) {
      _display += '.';
      _hasDecimal = true;
    }
  }

  void inputOperation(String nextOperation) {
    double inputValue = double.parse(_display);

    if (_previousValue.isEmpty) {
      _previousValue = inputValue.toString();
    } else if (_operation.isNotEmpty) {
      double prevValue = double.parse(_previousValue);
      double result = _calculate(prevValue, inputValue, _operation);

      _display = _formatResult(result);
      _previousValue = result.toString();
    }

    _waitingForOperand = true;
    _operation = nextOperation;
  }

  void calculate() {
    if (_operation.isEmpty || _waitingForOperand) return;

    double inputValue = double.parse(_display);
    double prevValue = double.parse(_previousValue);
    double result = _calculate(prevValue, inputValue, _operation);

    // Add to history
    String calculation = '$prevValue $_operation $inputValue = $result';
    addToHistory(calculation);

    _display = _formatResult(result);
    _previousValue = '';
    _operation = '';
    _waitingForOperand = true;
    _hasDecimal = _display.contains('.');
  }

  double _calculate(
    double firstOperand,
    double secondOperand,
    String operation,
  ) {
    switch (operation) {
      case '+':
        return firstOperand + secondOperand;
      case '-':
        return firstOperand - secondOperand;
      case '×':
        return firstOperand * secondOperand;
      case '÷':
        if (secondOperand == 0) {
          throw Exception('Cannot divide by zero');
        }
        return firstOperand / secondOperand;
      case '%':
        return firstOperand % secondOperand;
      default:
        return secondOperand;
    }
  }

  String _formatResult(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    } else {
      return value
          .toStringAsFixed(8)
          .replaceAll(RegExp(r'0*$'), '')
          .replaceAll(RegExp(r'\.$'), '');
    }
  }

  void backspace() {
    if (_display.length > 1) {
      String newDisplay = _display.substring(0, _display.length - 1);
      if (newDisplay.isEmpty) {
        _display = '0';
      } else {
        _display = newDisplay;
        _hasDecimal = _display.contains('.');
      }
    } else {
      _display = '0';
    }
  }

  void toggleSign() {
    if (_display != '0') {
      if (_display.startsWith('-')) {
        _display = _display.substring(1);
      } else {
        _display = '-$_display';
      }
    }
  }
}
