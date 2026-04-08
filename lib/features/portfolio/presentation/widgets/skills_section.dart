import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/skill_entity.dart';
import 'section_title.dart';

class SkillsSection extends StatelessWidget {
  final List<SkillEntity> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final colors = context.appColors;
    final categories = skills.map((s) => s.category).toSet().toList();

    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: isWide ? 80 : 24, vertical: 80),
      color: colors.surface,
      child: Column(
        children: [
          const SectionTitle(title: 'Skills', subtitle: 'What I work with'),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: categories.map((cat) {
              final catSkills =
                  skills.where((s) => s.category == cat).toList();
              return _SkillCard(category: cat, skills: catSkills);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final String category;
  final List<SkillEntity> skills;

  const _SkillCard({required this.category, required this.skills});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              color: AppTheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ...skills.map((skill) => _SkillBar(skill: skill)),
        ],
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final SkillEntity skill;

  const _SkillBar({required this.skill});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(skill.name,
                  style: TextStyle(
                      color: colors.textPrimary, fontSize: 13)),
              Text(
                '${(skill.proficiency * 100).toInt()}%',
                style: TextStyle(
                    color: colors.textSecondary, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: skill.proficiency,
              backgroundColor: colors.surface,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppTheme.primary),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
