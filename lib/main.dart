import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
import 'package:stepik_part_9_provider/change_color.dart';
// import 'package:stepik_part_9_provider/custom_provider.dart';
import 'package:stepik_part_9_provider/my_inheried.dart';

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

      // My custom provider (not needed provider package)
      // home: CustomChangeNotifierProvider(
      //   model: ChangeColor(
      //     ChangeColorState(),
      //   ),
      //   child: const PageWithSquare(),
      // ),

      // InheritedWidget (not needed provider package)
      home: MyInheritedWidget(
        myState: ChangeColor(
          ChangeColorState(),
        ),
        child: const PageWithSquare(),
      ),

      // Need provider package
      // home: ChangeNotifierProvider(
      //     create: (BuildContext context) => ChangeColor(
      //           ChangeColorState(),
      //         ),
      //     child: const PageWithSquare()),
    );
  }
}

class PageWithSquare extends StatelessWidget {
  const PageWithSquare({super.key});

  @override
  Widget build(BuildContext context) {
    // Need provider package
    // var appBarColor = context.watch<ChangeColor>();

    // InheritedWidget (not needed provider package)
    var appBarColor = MyInheritedWidget.of(context)?.myState;

    // My custom provider (not needed provider package)
    // var appBarColor = CustomChangeNotifierProvider.read<ChangeColor>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        // Need provider package
        // title: Text(
        //   'Homework Provider',
        //   style: TextStyle(
        //     color: Color(appBarColor.value.colorTitleAppBar),
        //   ),),

        title: ListenableBuilder(
          listenable: appBarColor!,
          builder: (BuildContext context, Widget? child) {
            return Text(
              'Homework Provider',
              style: TextStyle(
                color: Color(appBarColor.value.colorTitleAppBar),
              ),
            );
          },
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _AnimatedSquare(),
            SizedBox(
              height: 10,
            ),
            _Switch(),
          ],
        ),
      ),
    );
  }
}

class _AnimatedSquare extends StatelessWidget {
  const _AnimatedSquare();

  @override
  Widget build(BuildContext context) {
    // Need provider package
    // var squareColor = context.watch<ChangeColor>();

    // InheritedWidget (not needed provider package)
    var squareColor = MyInheritedWidget.of(context)?.myState;

    // My custom provider (not needed provider package)
    // var squareColor = CustomChangeNotifierProvider.read<ChangeColor>(context);

    return ListenableBuilder(
      listenable: squareColor!,
      builder: (BuildContext context, Widget? child) {
        return AnimatedCrossFade(
          firstChild: _Square(
            squareColor: squareColor.value.squareColor,
            text: 'firstChild',
          ),
          secondChild: _Square(
            squareColor: squareColor.value.squareColor,
            text: 'secondChild',
          ),
          crossFadeState: squareColor.value.valueSwitch
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(seconds: 2),
        );
      },
    );

    // return ListenableBuilder(
    //   listenable: squareColor!,
    //   builder: (BuildContext context, Widget? child) {
    // return AnimatedContainer(
    //       height: 200,
    //       width: 200,
    //       duration: const Duration(
    //         seconds: 2,
    //       ),
    //       color: Color(
    //         squareColor.value.squareColor,
    //       ),
    //     );
    //   },
    // );
  }
}

class _Square extends StatelessWidget {
  const _Square({
    required this.squareColor,
    required this.text,
  });

  final int squareColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ColoredBox(
          color: Color(squareColor),
          child: const SizedBox.square(
            dimension: 200,
          ),
        ),
        Text(text),
      ],
    );
  }
}

class _Switch extends StatelessWidget {
  const _Switch();

  @override
  Widget build(BuildContext context) {
    //need provider package
    // var switsh = context.watch<ChangeColor>();

    // InheritedWidget (not needed provider package)
    var switsh = MyInheritedWidget.of(context)?.myState;

    // my custom provider (not needed provider package)
    // var switsh =
    //     CustomChangeNotifierProvider.watch<ChangeColor>(context);

    return ValueListenableBuilder(
      valueListenable: switsh!,
      builder: (BuildContext context, value, Widget? child) {
        return Switch(
          value: switsh.value.valueSwitch,
          onChanged: (_) {
            switsh.changeColor();
          },
        );
      },
    );
  }
}
