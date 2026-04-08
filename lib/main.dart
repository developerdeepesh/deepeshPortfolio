import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_bloc.dart';
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'features/portfolio/presentation/pages/portfolio_page.dart';
import 'features/portfolio/presentation/pages/splash_screen.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool _showSplash = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Deepesh Raghaw – Portfolio',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
            home: _showSplash
                ? SplashScreen(
                    onComplete: () => setState(() => _showSplash = false),
                  )
                : BlocProvider(
                    create: (_) => di.sl<PortfolioBloc>(),
                    child: const PortfolioPage(),
                  ),
          );
        },
      ),
    );
  }
}
