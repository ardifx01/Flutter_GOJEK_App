import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class AppTheme {
  static const _primary = Color(0xFF00AA13); // Gojek-like green
  static const _primaryDark = Color(0xFF008A0F);
  static const _bg = Color(0xFFF6F7FB);
  static const _text = Color(0xFF111418);
  static const _muted = Color(0xFF6B7280);

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _primary,
      primary: _primary,
      surface: Colors.white,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _bg,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: _primary.withValues(alpha: .14),
        elevation: 0,
        height: 64,
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            final isSelected = states.contains(WidgetState.selected);
            return TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? _text : _muted,
            );
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            final isSelected = states.contains(WidgetState.selected);
            return IconThemeData(
              color: isSelected ? _text : _muted,
              size: AppSizes.iconMd,
            );
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _bg,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          color: _text,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(color: _text),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: _text,
        displayColor: _text,
      ).copyWith(
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: _text),
        titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: _text),
        bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: _text),
        bodyMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: _text),
        bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: _muted),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primary,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, AppSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.lg),
          ),
          elevation: 0,
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.pressed)
                ? _primaryDark.withValues(alpha: .12)
                : null,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          borderSide: const BorderSide(color: _primary),
        ),
        prefixIconColor: _muted,
        hintStyle: TextStyle(color: _muted),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: const Color(0xFFEFF6F1),
        selectedColor: _primary,
        labelStyle: TextStyle(color: _text),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
      ),
      dividerTheme: const DividerThemeData(color: Color(0xFFE5E7EB)),
    );
  }
}
