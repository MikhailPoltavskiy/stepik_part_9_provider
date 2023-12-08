import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stepik_part_9_provider/change_color.dart';
import 'package:stepik_part_9_provider/custom_provider.dart';

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
      home: CustomChangeNotifierProvider(
          model: ChangeColor(ChangeColorState()),
          child: const PageWithSquare()),
    );
  }
}

class PageWithSquare extends StatelessWidget {
  const PageWithSquare({super.key});

  @override
  Widget build(BuildContext context) {
    var changeColor = CustomChangeNotifierProvider.read<ChangeColor>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListenableBuilder(
          listenable: changeColor!,
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
            const _Switch(),
          ],
        ),
      ),
    );
  }
}

class _Switch extends StatelessWidget {
  const _Switch();

  @override
  Widget build(BuildContext context) {
    var newChangeColor =
        CustomChangeNotifierProvider.watch<ChangeColor>(context);
    return ValueListenableBuilder(
      valueListenable: newChangeColor!,
      builder: (BuildContext context, value, Widget? child) {
        return Switch(
          value: newChangeColor.value.valueSwitch,
          onChanged: (_) {
            newChangeColor.changeColor();
          },
        );
      },
    );
  }
}
