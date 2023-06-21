import 'package:math_expressions/math_expressions.dart';

String equalPressed(String calcValue) {
  String finalUserInput = calcValue;

  ///For the multiplication expression
  finalUserInput = calcValue.replaceAll('x', '*');

  if (calcValue == '') {
    return (0).toString();
  } else {
    ///Instantiating the Parser() class
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);

    ///Instantiating the ContextModel() class
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval.toString();
  }
}
