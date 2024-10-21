import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: AppRadio(
          value: false,
        ),
      ),
    );
  }
}

class AppRadio extends StatefulWidget {
  const AppRadio({super.key, required this.value, this.onChange});

  /// initial value
  final bool value;

  ///returns an updated value each time it is changed
  final Function(bool)? onChange;

  @override
  State<AppRadio> createState() => _AppRadioState();
}

class _AppRadioState extends State<AppRadio> {
  final ValueNotifier<bool> _valueHolder = ValueNotifier<bool>(true);

  @override
  void initState() {
    //assign initial value
    _valueHolder.value = widget.value;
    super.initState();
  }

  @override
  void dispose() {
    _valueHolder.dispose(); //important
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      key: ValueKey(_valueHolder.value), //this is optional
      valueListenable: _valueHolder,
      builder: (BuildContext context, bool value, Widget? child) {
        return GestureDetector(
          onTap: () {
            //updates the value
            _valueHolder.value = !_valueHolder.value;
            //checks that changes is being listened to then returns the updated value
            if (widget.onChange != null) widget.onChange!(_valueHolder.value);
          },
          child: SizedBox(
            height: 16,
            width: 28,
            child: Stack(
              children: [
                Center(
                  child: AnimatedContainer(
                    height: 12,
                    width: 28,
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        color: _valueHolder.value
                            ? Colors.orange //active color
                            : Colors.grey, //inactive color
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 500),
                  offset: _valueHolder.value
                      ? const Offset(.9, 0) //controls the right offset
                      : const Offset(-.5, 0), //controls the left offset
                  child: Container(
                    height: 20,
                    width: 20,
                    alignment: _valueHolder.value
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _valueHolder.value
                            ? Colors.orange //active color
                            : Colors.grey, //inactive color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
