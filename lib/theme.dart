import 'package:flutter/material.dart';

/// Paleta inspirada no SUAP.
class AppColors {
  static const sidebar = Color(0xFF2B2B2B);
  static const sidebarDivisor = Color(0xFF3C3C3C);
  static const fundo = Color(0xFFF0F0F0);
  static const chip = Color(0xFFE2E2E2);
  static const texto = Color(0xFF333333);
  static const textoSuave = Color(0xFF8A8A8A);
  static const verde = Color(0xFF2BAA3F);
  static const teal = Color(0xFF0E8077);
  static const tealClaro = Color(0xFF5CCFC1);
  static const destaqueFundo = Color(0xFFF2FCFB);
  static const destaqueBorda = Color(0xFFCFEAE7);
  static const vermelho = Color(0xFFCC0000);
  static const rodape = Color(0xFF242424);
}

class AppTheme {
  static ThemeData get tema => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.teal,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.fundo,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.sidebar,
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        dividerColor: const Color(0xFFE5E5E5),
      );
}
