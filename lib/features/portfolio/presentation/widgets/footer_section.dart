import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      color: colors.surface,
      child: Column(
        children: [
          Text(
            'Designed & Built by ${AppConstants.name}',
            style: TextStyle(color: colors.textSecondary, fontSize: 13),
          ),
          const SizedBox(height: 4),
          const Text(
            'Built with Flutter 💙',
            style: TextStyle(color: AppTheme.primary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
