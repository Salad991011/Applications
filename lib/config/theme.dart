import 'package:flutter/material.dart';

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

ThemeData theme() {
  return ThemeData(
    primarySwatch: buildMaterialColor(
        const Color.fromARGB(255, 94, 194, 79).withOpacity(0.850)),
    primaryColorDark: const Color(0xff101a3d),
    primaryColorLight: const Color(0xffaff8c8),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    backgroundColor: const Color.fromARGB(162, 245, 245, 245),
    fontFamily: 'Grandstander',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFFF5F5F5),
        fontWeight: FontWeight.w700,
        fontSize: 36,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFF5F5F5),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      displaySmall: TextStyle(
        color: Color(0xFFF5F5F5),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFFF5F5F5),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headlineSmall: TextStyle(
        color: Color(0xFFF5F5F5),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        color: Color(0xFFF5F5F5),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFF5F5F5),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodySmall: TextStyle(
        color: Color(0xFFF5F5F5),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
