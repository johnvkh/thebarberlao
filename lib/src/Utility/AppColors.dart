import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  static const Color primary    = Color(0xFFD4A84B); // gold
  static const Color primaryDark= Color(0xFFB8913A);
  static const Color dark       = Color(0xFF0F0F0F);
  static const Color dark2      = Color(0xFF1A1A1A);
  static const Color dark3      = Color(0xFF252525);
  static const Color cream      = Color(0xFFF9F4EC);
  static const Color surface    = Color(0xFF1E1E1E);
  static const Color textLight  = Color(0xFFF5F0E8);
  static const Color textMuted  = Color(0xFF888888);
  static const Color white      = Color(0xFFFFFFFF);
  static const Color divider    = Color(0xFF2E2E2E);
}

class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary:   AppColors.primary,
      surface:   AppColors.dark2,
      onPrimary: AppColors.dark,
      onSurface: AppColors.textLight,
    ),
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 56, fontWeight: FontWeight.w900, color: AppColors.textLight, letterSpacing: -1,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 40, fontWeight: FontWeight.w700, color: AppColors.textLight,
      ),
      displaySmall: GoogleFonts.playfairDisplay(
        fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.textLight,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.textLight,
      ),
      bodyLarge: GoogleFonts.notoSansLao(
        fontSize: 15, color: AppColors.textLight, height: 1.6,
      ),
      bodyMedium: GoogleFonts.notoSansLao(
        fontSize: 13, color: AppColors.textMuted, height: 1.5,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11, letterSpacing: 0.15, color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark.withOpacity(0.95),
      elevation: 0,
      centerTitle: false,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: const IconThemeData(color: AppColors.textLight),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.divider, thickness: 1),
    cardTheme: CardThemeData(
      color: AppColors.dark3,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.primary.withOpacity(0.15)),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.dark,
      unselectedLabelColor: AppColors.textMuted,
      indicator: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: GoogleFonts.notoSansLao(fontSize: 13, fontWeight: FontWeight.w700),
      unselectedLabelStyle: GoogleFonts.notoSansLao(fontSize: 13),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.dark,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    ),
  );
}
