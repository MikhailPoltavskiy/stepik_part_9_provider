import 'package:flutter/material.dart';
import 'package:stepik_part_9_provider/change_color.dart';

class MyInheritedWidget extends InheritedWidget {
  final ChangeColor myState;

  const MyInheritedWidget(
      {super.key, required super.child, required this.myState});

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return (myState.value.colorTitleAppBar !=
            oldWidget.myState.value.colorTitleAppBar ||
        myState.value.colorSquare != oldWidget.myState.value.colorSquare ||
        myState.value.valueSwitch != oldWidget.myState.value.valueSwitch);
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}
