import 'dart:math' as math;

import 'package:flutter/material.dart';

class ChangeColor extends ValueNotifier<ChangeColorState> {
  ChangeColor(super.value);

  void changeColor() {
    value._valueSwitch = !value._valueSwitch;
    value._colorOne = _getRandomInt();
    value._colorTwo = _getRandomInt();
    notifyListeners();
  }
}

class ChangeColorState {
  bool _valueSwitch = true;
  int _colorOne = _getRandomInt();
  int _colorTwo = _getRandomInt();

  bool get valueSwitch => _valueSwitch;
  int get squareColor => _colorOne;
  int get colorTitleAppBar => _colorTwo;
}

int _getRandomInt() {
  return (math.Random().nextDouble() * 0xFFFFFFFF).toInt();
}
