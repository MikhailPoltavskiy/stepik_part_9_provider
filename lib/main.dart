import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stepik_part_9_provider/change_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework Provider',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black,
          ),
        ),
      ),
      home: const PageWithSquare(),
    );
  }
}

class PageWithSquare extends StatelessWidget {
  const PageWithSquare({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeColor changeColor = ChangeColor(ChangeColorState());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListenableBuilder(
          listenable: changeColor,
          builder: (BuildContext context, Widget? child) {
            return Text(
              'Homework Provider',
              style: TextStyle(
                color: Color(changeColor.value.colorTitleAppBar),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListenableBuilder(
              listenable: changeColor,
              builder: (BuildContext context, Widget? child) {
                return AnimatedContainer(
                  height: 200,
                  width: 200,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  color: Color(
                    changeColor.value.colorSquare,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            _Switch(changeColor: changeColor),
          ],
        ),
      ),
    );
  }
}

class _Switch extends StatelessWidget {
  const _Switch({
    required this.changeColor,
  });

  final ChangeColor changeColor;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: changeColor,
      builder: (BuildContext context, value, Widget? child) {
        return Switch(
          value: changeColor.value.valueSwitch,
          onChanged: (_) {
            changeColor.changeColor();
          },
        );
      },
    );
  }
}
