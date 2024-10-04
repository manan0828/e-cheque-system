import 'package:chekpay/module/homepage/home_page_ui.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme.light(
        surface: Colors.white, onSurface: Colors.black87));

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme.dark(
        surface: Colors.grey, onSurface: Colors.white70));

class ThemeProvider extends StatefulWidget {
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const ThemeProvider({
    required this.lightTheme,
    required this.darkTheme,
    super.key,
  });

  @override
  State<ThemeProvider> createState() => _ThemeProviderState();
}

class _ThemeProviderState extends State<ThemeProvider> {
  ThemeData _currentTheme =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.blue);

  void toggleTheme() {
    setState(() {
      _currentTheme = _currentTheme.brightness == Brightness.light
          ? widget.darkTheme
          : widget.lightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _currentTheme,
      darkTheme: widget.darkTheme,
      themeMode: ThemeMode.system,
      home: const Homepage(),
    );
  }
}
