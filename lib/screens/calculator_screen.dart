import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/calculator_model.dart';
import '../widgets/calculator_button.dart';
import '../widgets/display_screen.dart';
import '../utils/calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorModel _calculator = CalculatorModel();
  String _selectedOperation = '';
  bool _showHistory = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Kalkulator', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              _showHistory ? Icons.calculate : Icons.history,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _showHistory = !_showHistory;
              });
            },
          ),
          if (_showHistory)
            IconButton(
              icon: const Icon(Icons.clear_all, color: Colors.white),
              onPressed: () {
                _calculator.clearHistory();
                setState(() {});
              },
            ),
        ],
      ),
      body: Column(
        children: [
          // Display
          DisplayScreen(
            display: _calculator.display,
            operation: _selectedOperation,
            previousValue: _calculator.waitingForOperand
                ? _calculator.display
                : '',
          ),

          // History or Calculator
          Expanded(child: _showHistory ? _buildHistory() : _buildCalculator()),
        ],
      ),
    );
  }

  Widget _buildHistory() {
    return Container(
      color: const Color(0xFF1C1C1C),
      child: _calculator.history.isEmpty
          ? const Center(
              child: Text(
                'Tidak ada riwayat',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _calculator.history.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2C2C),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _calculator.history[index],
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.right,
                  ),
                );
              },
            ),
    );
  }

  Widget _buildCalculator() {
    return Container(
      color: const Color(0xFF1C1C1C),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // Row 1: Clear, +/-, %, ÷
          Row(
            children: [
              CalculatorButton(
                text: 'AC',
                type: ButtonType.clear,
                onPressed: () => _onClearPressed(),
              ),
              CalculatorButton(
                text: '+/-',
                type: ButtonType.function,
                onPressed: () => _onSignToggle(),
              ),
              CalculatorButton(
                text: '%',
                type: ButtonType.function,
                onPressed: () => _onOperationPressed('%'),
              ),
              CalculatorButton(
                text: '÷',
                type: ButtonType.operation,
                isSelected: _selectedOperation == '÷',
                onPressed: () => _onOperationPressed('÷'),
              ),
            ],
          ),

          // Row 2: 7, 8, 9, ×
          Row(
            children: [
              CalculatorButton(
                text: '7',
                onPressed: () => _onDigitPressed('7'),
              ),
              CalculatorButton(
                text: '8',
                onPressed: () => _onDigitPressed('8'),
              ),
              CalculatorButton(
                text: '9',
                onPressed: () => _onDigitPressed('9'),
              ),
              CalculatorButton(
                text: '×',
                type: ButtonType.operation,
                isSelected: _selectedOperation == '×',
                onPressed: () => _onOperationPressed('×'),
              ),
            ],
          ),

          // Row 3: 4, 5, 6, -
          Row(
            children: [
              CalculatorButton(
                text: '4',
                onPressed: () => _onDigitPressed('4'),
              ),
              CalculatorButton(
                text: '5',
                onPressed: () => _onDigitPressed('5'),
              ),
              CalculatorButton(
                text: '6',
                onPressed: () => _onDigitPressed('6'),
              ),
              CalculatorButton(
                text: '-',
                type: ButtonType.operation,
                isSelected: _selectedOperation == '-',
                onPressed: () => _onOperationPressed('-'),
              ),
            ],
          ),

          // Row 4: 1, 2, 3, +
          Row(
            children: [
              CalculatorButton(
                text: '1',
                onPressed: () => _onDigitPressed('1'),
              ),
              CalculatorButton(
                text: '2',
                onPressed: () => _onDigitPressed('2'),
              ),
              CalculatorButton(
                text: '3',
                onPressed: () => _onDigitPressed('3'),
              ),
              CalculatorButton(
                text: '+',
                type: ButtonType.operation,
                isSelected: _selectedOperation == '+',
                onPressed: () => _onOperationPressed('+'),
              ),
            ],
          ),

          // Row 5: 0, ., =
          Row(
            children: [
              CalculatorButton(
                text: '0',
                flex: 2.0,
                onPressed: () => _onDigitPressed('0'),
              ),
              CalculatorButton(text: '.', onPressed: () => _onDecimalPressed()),
              CalculatorButton(
                text: '=',
                type: ButtonType.equals,
                onPressed: () => _onEqualsPressed(),
              ),
            ],
          ),

          // Scientific functions row
          Row(
            children: [
              CalculatorButton(
                text: '√',
                type: ButtonType.function,
                onPressed: () => _onScientificFunction('sqrt'),
              ),
              CalculatorButton(
                text: 'x²',
                type: ButtonType.function,
                onPressed: () => _onScientificFunction('square'),
              ),
              CalculatorButton(
                text: '⌫',
                type: ButtonType.function,
                onPressed: () => _onBackspacePressed(),
              ),
              CalculatorButton(
                text: 'CE',
                type: ButtonType.clear,
                onPressed: () => _onClearEntryPressed(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onDigitPressed(String digit) {
    HapticFeedback.selectionClick();
    setState(() {
      _calculator.inputDigit(digit);
      _selectedOperation = '';
    });
  }

  void _onOperationPressed(String operation) {
    HapticFeedback.selectionClick();
    try {
      setState(() {
        _calculator.inputOperation(operation);
        _selectedOperation = operation;
      });
    } catch (e) {
      _showError(e.toString());
    }
  }

  void _onEqualsPressed() {
    HapticFeedback.lightImpact();
    try {
      setState(() {
        _calculator.calculate();
        _selectedOperation = '';
      });
    } catch (e) {
      _showError(e.toString());
    }
  }

  void _onDecimalPressed() {
    HapticFeedback.selectionClick();
    setState(() {
      _calculator.inputDecimal();
    });
  }

  void _onClearPressed() {
    HapticFeedback.selectionClick();
    setState(() {
      _calculator.clear();
      _selectedOperation = '';
    });
  }

  void _onClearEntryPressed() {
    HapticFeedback.selectionClick();
    setState(() {
      _calculator.clearEntry();
    });
  }

  void _onSignToggle() {
    HapticFeedback.selectionClick();
    setState(() {
      _calculator.toggleSign();
    });
  }

  void _onBackspacePressed() {
    HapticFeedback.selectionClick();
    setState(() {
      _calculator.backspace();
    });
  }

  void _onScientificFunction(String function) {
    HapticFeedback.selectionClick();
    try {
      double currentValue = double.parse(_calculator.display);
      double result;

      switch (function) {
        case 'sqrt':
          result = CalculatorLogic.squareRoot(currentValue);
          break;
        case 'square':
          result = CalculatorLogic.power(currentValue, 2);
          break;
        case 'sin':
          result = CalculatorLogic.sin(currentValue);
          break;
        case 'cos':
          result = CalculatorLogic.cos(currentValue);
          break;
        case 'tan':
          result = CalculatorLogic.tan(currentValue);
          break;
        case 'log':
          result = CalculatorLogic.log(currentValue);
          break;
        case 'ln':
          result = CalculatorLogic.ln(currentValue);
          break;
        default:
          return;
      }

      setState(() {
        String calculation =
            '$function($currentValue) = ${CalculatorLogic.formatNumber(result)}';
        _calculator.addToHistory(calculation);
        _calculator.clear();
        _calculator.inputDigit(CalculatorLogic.formatNumber(result));
      });
    } catch (e) {
      _showError('Invalid operation');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
