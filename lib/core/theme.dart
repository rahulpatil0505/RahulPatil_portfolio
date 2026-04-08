import 'package:flutter/material.dart';

extension AppColors on BuildContext {
  Color get bg => Theme.of(this).scaffoldBackgroundColor;
  Color get surface => Theme.of(this).colorScheme.surface;
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get accent => const Color(0xFF00C2A8);
  Color get accentWarm => const Color(0xFFFF6B35);
  Color get textMuted =>
      isDark ? const Color(0xFF6B7280) : const Color(0xFF9CA3AF);
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

class AppTheme {
  AppTheme._();

  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF5F3EE),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0A0A0A),
      secondary: Color(0xFF00C2A8),
      // secondary: Color(0xFF2563EB),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF0A0A0A),
    ),
    fontFamily: 'Courier',
    useMaterial3: true,
  );

  static ThemeData dark() => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF080A0F),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFFFFFFF),
      secondary: Color(0xFF00C2A8),
      // secondary: Color(0xFF2563EB),
      surface: Color(0xFF111318),
      onSurface: Color(0xFFFFFFFF),
    ),
    fontFamily: 'Courier',
    useMaterial3: true,
  );
}

class AppTextStyles {
  AppTextStyles._();

  static TextStyle heroTitle({required bool isWide, required Color color}) =>
      TextStyle(
        color: color,
        fontSize: isWide ? 62 : 38,
        fontWeight: FontWeight.w900,
        height: 1.05,
        letterSpacing: -1.5,
      );

  static TextStyle sectionTitle(Color color) => TextStyle(
    color: color,
    fontSize: 38,
    fontWeight: FontWeight.w900,
    letterSpacing: -1,
    height: 1.1,
  );

  static TextStyle label(Color color) => TextStyle(
    color: color,
    fontFamily: 'Courier',
    fontSize: 12,
    letterSpacing: 2,
  );

  static TextStyle body(Color color) =>
      TextStyle(color: color, fontSize: 15, height: 1.8);

  static TextStyle mono(Color color, {double size = 13}) => TextStyle(
    color: color,
    fontFamily: 'Courier',
    fontSize: size,
    letterSpacing: 0.5,
  );
}
