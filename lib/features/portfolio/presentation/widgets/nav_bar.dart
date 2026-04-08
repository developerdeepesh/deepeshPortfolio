import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavTap;

  const NavBar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final colors = context.appColors;
    final isDark = context.isDark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      color: colors.background.withValues(alpha: 0.95),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
              color: AppTheme.primary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          Row(
            children: [
              if (isWide)
                ...['About', 'Skills', 'Projects', 'Experience', 'Contact']
                    .map((item) => _NavItem(label: item, onTap: () => onNavTap(item))),
              const SizedBox(width: 8),
              // Theme toggle
              _ThemeToggle(isDark: isDark),
              if (!isWide)
                PopupMenuButton<String>(
                  icon: Icon(Icons.menu, color: colors.textPrimary),
                  color: colors.surface,
                  onSelected: onNavTap,
                  itemBuilder: (_) =>
                      ['About', 'Skills', 'Projects', 'Experience', 'Contact']
                          .map((item) => PopupMenuItem(
                                value: item,
                                child: Text(item,
                                    style: TextStyle(color: colors.textPrimary)),
                              ))
                          .toList(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  final bool isDark;
  const _ThemeToggle({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      child: GestureDetector(
        onTap: () => context.read<ThemeBloc>().add(ToggleTheme()),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 56,
          height: 28,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isDark ? AppTheme.primary : const Color(0xFFDDDDEE),
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                size: 14,
                color: isDark ? AppTheme.primary : Colors.orange,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _hovered ? AppTheme.primary : colors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
