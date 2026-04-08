import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/experience_entity.dart';
import 'section_title.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceEntity> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final colors = context.appColors;

    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: isWide ? 80 : 24, vertical: 80),
      color: colors.surface,
      child: Column(
        children: [
          const SectionTitle(
              title: 'Experience', subtitle: 'My professional journey'),
          const SizedBox(height: 48),
          ...experiences.asMap().entries.map(
                (e) => _TimelineItem(
                  experience: e.value,
                  isLast: e.key == experiences.length - 1,
                ),
              ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final ExperienceEntity experience;
  final bool isLast;

  const _TimelineItem({required this.experience, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final colors = context.appColors;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot + vertical connector
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppTheme.primary.withValues(alpha: 0.35),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Container(
              height: isWide?MediaQuery.of(context).size.height*0.35:MediaQuery.of(context).size.height*0.60,
              margin: const EdgeInsets.only(bottom: 32),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppTheme.primary.withValues(alpha: 0.15)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isWide
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                child: _RoleInfo(experience: experience)),
                            const SizedBox(width: 16),
                            _PeriodBadge(period: experience.period),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _RoleInfo(experience: experience),
                            const SizedBox(height: 8),
                            _PeriodBadge(period: experience.period),
                          ],
                        ),
                  const SizedBox(height: 12),
                  Text(
                    experience.description,
                    style: TextStyle(
                        color: colors.textSecondary,
                        fontSize: 14,
                        height: 1.6),
                  ),
                  const SizedBox(height: 12),
                  ...experience.achievements.map(
                    (a) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('▸ ',
                              style: TextStyle(color: AppTheme.primary)),
                          Expanded(
                            child: Text(
                              a,
                              style: TextStyle(
                                  color: colors.textSecondary, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleInfo extends StatelessWidget {
  final ExperienceEntity experience;

  const _RoleInfo({required this.experience});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.role,
          style: TextStyle(
            color: colors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          experience.company,
          style: const TextStyle(color: AppTheme.primary, fontSize: 14),
        ),
      ],
    );
  }
}

class _PeriodBadge extends StatelessWidget {
  final String period;

  const _PeriodBadge({required this.period});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
      ),
      child: Text(
        period,
        style: const TextStyle(
            color: AppTheme.primary,
            fontSize: 12,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
