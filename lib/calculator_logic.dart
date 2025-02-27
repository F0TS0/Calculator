import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String expression = "";

  void addInput(String value) {
    if (value == "C") {
      expression = "";
    } else if (value == "=") {
      expression = _evaluateExpression();
    } else {
      expression += value;
    }
  }

  String _evaluateExpression() {
    try {
      // Replaced deprecated 'Parser' with 'ShuntingYardParser' as recommended
      ShuntingYardParser parser = ShuntingYardParser();
      Expression exp = parser.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  String getOutput() {
    return expression.isEmpty ? "0" : expression;
  }
}
