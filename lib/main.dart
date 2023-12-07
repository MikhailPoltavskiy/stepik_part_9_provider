import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:math' as math;

import 'package:provider/provider.dart';
import 'package:stepik_part_9_provider/change_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeColor>(
      create: (_) => ChangeColor(),
      child: MaterialApp(
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
      ),
    );
  }
}

class PageWithSquare extends StatelessWidget {
  const PageWithSquare({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeColor state = Provider.of<ChangeColor>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Homework Provider',
          style: TextStyle(
            color: Color(state.colorTitleAppBar),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              height: 200,
              width: 200,
              duration: const Duration(
                milliseconds: 500,
              ),
              color: Color(
                state.colorSquare,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Switch(
              value: state.valueSwitch,
              onChanged: (_) {
                state.changeColor();
              },
            ),
          ],
        ),
      ),
    );
  }
}
