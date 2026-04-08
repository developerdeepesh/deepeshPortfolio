import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onViewProjects;

  const HeroSection({super.key, this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;
    final colors = context.appColors;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide ? 80 : 24,
        vertical: isWide ? 100 : 60,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.background,
            AppTheme.primary.withValues(alpha: 0.08),
          ],
        ),
      ),
      child: isWide
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _HeroContent(onViewProjects: onViewProjects)),
                const SizedBox(width: 60),
                const _HeroAvatar(),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _HeroAvatar(),
                const SizedBox(height: 40),
                _HeroContent(centered: true, onViewProjects: onViewProjects),
              ],
            ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  final bool centered;
  final VoidCallback? onViewProjects;

  const _HeroContent({this.centered = false, this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello, I\'m',
          style: TextStyle(
              color: AppTheme.primary, fontSize: 18, letterSpacing: 2),
        ),
        const SizedBox(height: 8),
        Text(
          AppConstants.name,
          style: TextStyle(
            color: colors.textPrimary,
            fontSize: 52,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment:
              centered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Text('I\'m a ',
                style:
                    TextStyle(color: colors.textSecondary, fontSize: 20)),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'Senior Flutter Developer',
                  textStyle: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  speed: const Duration(milliseconds: 80),
                ),
                TypewriterAnimatedText(
                  'Full Stack Developer',
                  textStyle: const TextStyle(
                      color: AppTheme.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  speed: const Duration(milliseconds: 80),
                ),
                TypewriterAnimatedText(
                  'Team Lead',
                  textStyle: const TextStyle(
                      color: AppTheme.accent,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  speed: const Duration(milliseconds: 80),
                ),
                TypewriterAnimatedText(
                  'Solution Architect (Mobile)',
                  textStyle: const TextStyle(
                      color: AppTheme.accent,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                  speed: const Duration(milliseconds: 80),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 480,
          child: Text(
            AppConstants.bio,
            style: TextStyle(
                color: colors.textSecondary, fontSize: 15, height: 1.7),
            textAlign: centered ? TextAlign.center : TextAlign.left,
          ),
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment:
              centered ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _PrimaryButton(
              label: 'Download CV',
              icon: Icons.download,
              onTap: () => launchUrl(Uri.parse(AppConstants.resumeUrl)),
            ),
            _OutlineButton(
              label: 'View Projects',
              onTap: onViewProjects ?? () {},
            ),
          ],
        ),
        const SizedBox(height: 36),
        Row(
          mainAxisAlignment:
              centered ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _SocialIcon(
                icon: FontAwesomeIcons.github, url: AppConstants.githubUrl),
            _SocialIcon(
                icon: FontAwesomeIcons.linkedin,
                url: AppConstants.linkedinUrl),
            _SocialIcon(
                icon: FontAwesomeIcons.twitter,
                url: AppConstants.twitterUrl),
          ],
        ),
      ],
    );
  }
}

class _HeroAvatar extends StatelessWidget {
  const _HeroAvatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppTheme.primary, AppTheme.secondary],
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.4),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ClipOval(
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const CircleAvatar(
              backgroundColor: AppTheme.darkSurface,
              child: Icon(Icons.person, size: 120, color: AppTheme.darkTextSecondary),
            ),
          ),
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _PrimaryButton(
      {required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OutlineButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.primary,
        side: const BorderSide(color: AppTheme.primary),
        padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: Container(
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _hovered ? AppTheme.primary : colors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: AppTheme.primary.withValues(alpha: 0.3)),
          ),
          child: FaIcon(widget.icon,
              size: 18, color: colors.textPrimary),
        ),
      ),
    );
  }
}
