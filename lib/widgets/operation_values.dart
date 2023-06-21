import 'package:flutter/foundation.dart';

/// Using 'ChangeNotifier to make state accessible and notify listeners
///when the state changes
class OperationValues extends ChangeNotifier {
  String _userInput = '';
  String _answer = '';

  String get userInput => _userInput;

  String get answer => _answer;

  /// These methods update the operation values
  void updateUserInput(String newValue) {
    _userInput = newValue;
    notifyListeners();
  }

  void updateAnswer(String newValue) {
    _answer = newValue;
    notifyListeners();
  }
}
