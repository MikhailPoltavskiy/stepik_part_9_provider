import 'package:flutter/material.dart';

class CustomChangeNotifierProvider<T extends ChangeNotifier>
    extends InheritedNotifier<T> {
  const CustomChangeNotifierProvider({
    super.key,
    required T model,
    required super.child,
  }) : super(
          notifier: model,
        );

  static T? watch<T extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CustomChangeNotifierProvider<T>>()
        ?.notifier;
  }

  static T? read<T extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            CustomChangeNotifierProvider<T>>()
        ?.widget;
    if (widget is CustomChangeNotifierProvider<T>) {
      return widget.notifier;
    } else {
      return null;
    }
  }
}
