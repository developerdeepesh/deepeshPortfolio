import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Column(
      children: [
        Text(
          subtitle.toUpperCase(),
          style: const TextStyle(
            color: AppTheme.primary,
            fontSize: 12,
            letterSpacing: 3,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: colors.textPrimary,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [AppTheme.primary, AppTheme.secondary]),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
