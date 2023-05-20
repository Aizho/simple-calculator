import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class AppViewModel extends ChangeNotifier {

  String userInput = '';
  String result = '0';

  List<String> buttonsList = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '.',
    '=',
  ];

  String calculate(String userInput) {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }

  getColor(String text) {
    if (text == '/' ||
        text == '*' ||
        text == '+' ||
        text == '-' ||
        text == 'C' ||
        text == '(' ||
        text == ')') {
      return Colors.red;
    } else if (text == 'AC') {
      return Colors.yellow[600];
    } else if (text == '=') {
      return Colors.green;
    }
    return Colors.black38;
  }

  buttonTapped(String text) {
    if (text == 'AC') {
      userInput = '';
      result = "0";
      return;
    }

    if (text == "C") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
        return;
      } else {
        return null;
      }
    }

    if (text == '=') {
      result = calculate(userInput);
      userInput = result;

      if (result.endsWith(".0") || userInput.endsWith(".0")) {
        result = result.replaceAll(".0", "");
        userInput = userInput.replaceAll(".0", "");
        return;
      }
    }

    userInput = userInput + text;
  }
}
