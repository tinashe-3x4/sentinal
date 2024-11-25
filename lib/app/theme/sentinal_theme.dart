import 'package:flutter/material.dart';

class SentinalTheme {
  static const primaryBlue = Color(0xFF0078D4);
  static const secondaryBlue = Color(0xFF2B88D8);
  static const accentBlue = Color(0xFF50A5E6);
  static const backgroundLight = Color(0xFFF8F9FA);
  static const surfaceLight = Color(0xFFFFFFFF);
  static const textDark = Color(0xFF323130);
  static const textMedium = Color(0xFF605E5C);
  static const textLight = Color(0xFFA19F9D);

  static const navigationRailGradientStart = Color(0xFF1A73E8);
  static const navigationRailGradientEnd = Color(0xFF64B5F6);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: primaryBlue,
          secondary: secondaryBlue,
          onSecondary: Colors.white,
          onSurface: textDark,
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: Colors.transparent, 
          elevation: 0,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 24,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.7),
            size: 24,
          ),
          selectedLabelTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelTextStyle: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          useIndicator: true,
          indicatorColor: Colors.white.withOpacity(0.15),
          labelType: NavigationRailLabelType.all,
          groupAlignment: -0.85,
        ),

        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 57,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.25,
            color: textDark,
          ),
          displayMedium: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w400,
            color: textDark,
          ),
          displaySmall: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w400,
            color: textDark,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: textDark,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textDark,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: textMedium,
          ),
        ),

        // Button Themes
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
            backgroundColor: primaryBlue,
            foregroundColor: Colors.white,
          ).copyWith(
            elevation: WidgetStateProperty.resolveWith<double>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) return 0;
                if (states.contains(WidgetState.hovered)) return 2;
                return 0;
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return primaryBlue.withOpacity(0.8);
                }
                if (states.contains(WidgetState.hovered)) {
                  return secondaryBlue;
                }
                return primaryBlue;
              },
            ),
          ),
        ),

        // Outlined Button Theme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: const BorderSide(color: primaryBlue),
            foregroundColor: primaryBlue,
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return primaryBlue.withOpacity(0.1);
                }
                if (states.contains(WidgetState.hovered)) {
                  return primaryBlue.withOpacity(0.05);
                }
                return Colors.transparent;
              },
            ),
          ),
        ),

        // Card Theme
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: surfaceLight,
        ),

        // Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: surfaceLight,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: textLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: textLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: primaryBlue, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),

        // App Bar Theme
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: surfaceLight,
          foregroundColor: textDark,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: textDark,
          ),
        ),
      );

  static LinearGradient get primaryGradient => const LinearGradient(
        colors: [primaryBlue, secondaryBlue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}
