import 'dart:math' as math;

import 'package:flutter/material.dart';

class ChangeColor with ChangeNotifier {
  bool _value = true;
  int _colorOne = _getRandomInt();
  int _colorTwo = _getRandomInt();

  bool get valueSwitch => _value;
  int get colorSquare => _colorOne;
  int get colorTitleAppBar => _colorTwo;

  void changeColor() {
    _value = !_value;
    _colorOne = _getRandomInt();
    _colorTwo = _getRandomInt();
    notifyListeners();
  }
}

int _getRandomInt() {
  return (math.Random().nextDouble() * 0xFFFFFFFF).toInt();
}
