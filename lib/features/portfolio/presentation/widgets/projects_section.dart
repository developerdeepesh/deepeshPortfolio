import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/project_entity.dart';
import 'section_title.dart';

class ProjectsSection extends StatefulWidget {
  final List<ProjectEntity> projects;

  const ProjectsSection({super.key, required this.projects});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final colors = context.appColors;
    final displayed =
        _showAll ? widget.projects : widget.projects.take(3).toList();

    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: isWide ? 80 : 24, vertical: 80),
      color: colors.background,
      child: Column(
        children: [
          const SectionTitle(title: 'Projects', subtitle: 'Things I\'ve built'),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: displayed.map((p) => _ProjectCard(project: p)).toList(),
          ),
          const SizedBox(height: 40),
          if (widget.projects.length > 3)
            OutlinedButton(
              onPressed: () => setState(() => _showAll = !_showAll),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primary,
                side: const BorderSide(color: AppTheme.primary),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(_showAll ? 'Show Less' : 'View All Projects'),
            ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectEntity project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  void _showDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ProjectDetailSheet(project: widget.project),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showDetails(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 340,
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? AppTheme.primary
                  : AppTheme.primary.withValues(alpha: 0.15),
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                        color: AppTheme.primary.withValues(alpha: 0.2),
                        blurRadius: 20,
                        spreadRadius: 2)
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  widget.project.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 180,
                    color: colors.surface,
                    child: const Icon(Icons.image,
                        color: AppTheme.primary, size: 48),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.project.isFeatured)
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Featured',
                          style: TextStyle(
                              color: AppTheme.primary,
                              fontSize: 11,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    Text(
                      widget.project.title,
                      style: TextStyle(
                        color: colors.textPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.description,
                      style: TextStyle(
                          color: colors.textSecondary,
                          fontSize: 13,
                          height: 1.5),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.technologies
                          .map((t) => _TechChip(label: t))
                          .toList(),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;

  const _TechChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
      ),
      child: Text(label,
          style: TextStyle(color: colors.textSecondary, fontSize: 11)),
    );
  }
}

class _IconLink extends StatelessWidget {
  final dynamic icon;
  final String url;
  final String tooltip;
  final bool isMaterial;

  const _IconLink({
    required this.icon,
    required this.url,
    required this.tooltip,
    this.isMaterial = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: () => launchUrl(Uri.parse(url)),
        icon: isMaterial
            ? Icon(icon as IconData, color: colors.textSecondary, size: 18)
            : FaIcon(icon as IconData,
                color: colors.textSecondary, size: 16),
        padding: const EdgeInsets.only(right: 8),
        constraints: const BoxConstraints(),
      ),
    );
  }
}

// ── Detail Sheet ──────────────────────────────────────────────────────────────

class _ProjectDetailSheet extends StatelessWidget {
  final ProjectEntity project;

  const _ProjectDetailSheet({required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.textSecondary.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          project.imageUrl,
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            height: 220,
                            color: colors.card,
                            child: const Icon(Icons.image,
                                color: AppTheme.primary, size: 48),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (project.isFeatured)
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Featured Project',
                            style: TextStyle(
                                color: AppTheme.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      Text(
                        project.title,
                        style: TextStyle(
                          color: colors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        project.description,
                        style: TextStyle(
                            color: colors.textSecondary,
                            fontSize: 15,
                            height: 1.7),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Tech Stack',
                        style: TextStyle(
                            color: colors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: project.technologies
                            .map((t) => _TechChip(label: t))
                            .toList(),
                      ),
                      const SizedBox(height: 24),
                      if (project.githubUrl != null ||
                          project.playStoreUrl != null || project.appStoreUrl != null) ...[
                        Text(
                          'Links',
                          style: TextStyle(
                              color: colors.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            if (project.githubUrl != null)
                              _LinkButton(
                                icon: FontAwesomeIcons.github,
                                label: 'GitHub',
                                url: project.githubUrl!,
                                isFa: true,
                              ),
                            if (project.playStoreUrl != null)
                              _LinkButton(
                                icon: Icons.open_in_new,
                                label: 'Playstore',
                                url: project.playStoreUrl!,
                              ),
                            if (project.appStoreUrl != null)
                              _LinkButton(
                                icon: Icons.open_in_new,
                                label: 'App Store',
                                url: project.appStoreUrl!,
                              )
                          ],
                        ),
                      ],
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LinkButton extends StatelessWidget {
  final dynamic icon;
  final String label;
  final String url;
  final bool isFa;

  const _LinkButton({
    required this.icon,
    required this.label,
    required this.url,
    this.isFa = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: isFa
          ? FaIcon(icon as IconData, size: 14)
          : Icon(icon as IconData, size: 16),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
