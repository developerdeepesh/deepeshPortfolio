import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color accent = Color(0xFFFF6584);

  // Dark colors
  static const Color darkBackground = Color(0xFF0A0E21);
  static const Color darkSurface = Color(0xFF1D1E33);
  static const Color darkCard = Color(0xFF252641);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0B3C6);

  // Light colors
  static const Color lightBackground = Color(0xFFF5F5FA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFEEEEF8);
  static const Color lightTextPrimary = Color(0xFF0A0E21);
  static const Color lightTextSecondary = Color(0xFF555770);

  // Legacy aliases (dark defaults — kept for widgets not yet theme-aware)
  static const Color background = darkBackground;
  static const Color surface = darkSurface;
  static const Color cardColor = darkCard;
  static const Color textPrimary = darkTextPrimary;
  static const Color textSecondary = darkTextSecondary;

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: darkBackground,
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: secondary,
          surface: darkSurface,
        ),
        extensions: const [AppColors.dark],
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        cardTheme: const CardThemeData(color: darkCard),
      );

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: lightBackground,
        colorScheme: const ColorScheme.light(
          primary: primary,
          secondary: secondary,
          surface: lightSurface,
        ),
        extensions: const [AppColors.light],
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
        cardTheme: const CardThemeData(color: lightCard),
      );
}

/// Theme extension — access via `Theme.of(context).appColors`
class AppColors extends ThemeExtension<AppColors> {
  final Color background;
  final Color surface;
  final Color card;
  final Color textPrimary;
  final Color textSecondary;

  const AppColors({
    required this.background,
    required this.surface,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
  });

  static const dark = AppColors(
    background: AppTheme.darkBackground,
    surface: AppTheme.darkSurface,
    card: AppTheme.darkCard,
    textPrimary: AppTheme.darkTextPrimary,
    textSecondary: AppTheme.darkTextSecondary,
  );

  static const light = AppColors(
    background: AppTheme.lightBackground,
    surface: AppTheme.lightSurface,
    card: AppTheme.lightCard,
    textPrimary: AppTheme.lightTextPrimary,
    textSecondary: AppTheme.lightTextSecondary,
  );

  @override
  AppColors copyWith({
    Color? background,
    Color? surface,
    Color? card,
    Color? textPrimary,
    Color? textSecondary,
  }) =>
      AppColors(
        background: background ?? this.background,
        surface: surface ?? this.surface,
        card: card ?? this.card,
        textPrimary: textPrimary ?? this.textPrimary,
        textSecondary: textSecondary ?? this.textSecondary,
      );

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      card: Color.lerp(card, other.card, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
    );
  }
}

extension ThemeContextX on BuildContext {
  AppColors get appColors =>
      Theme.of(this).extension<AppColors>() ?? AppColors.dark;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
