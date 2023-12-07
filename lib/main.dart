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
    ChangeColor state = ChangeColor(ChangeColor);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListenableBuilder(
          listenable: state,
          builder: (BuildContext context, Widget? child) {
            return Text(
              'Homework Provider',
              style: TextStyle(
                color: Color(state.colorTitleAppBar),
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
              listenable: state,
              builder: (BuildContext context, Widget? child) {
                return AnimatedContainer(
                  height: 200,
                  width: 200,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  color: Color(
                    state.colorSquare,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListenableBuilder(
              listenable: state,
              builder: (BuildContext context, Widget? child) {
                return Switch(
                  value: state.valueSwitch,
                  onChanged: (_) {
                    state.changeColor();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
