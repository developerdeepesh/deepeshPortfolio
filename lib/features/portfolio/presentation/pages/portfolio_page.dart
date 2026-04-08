import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollController = ScrollController();

  // Section keys for scroll navigation
  final _heroKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<PortfolioBloc>().add(LoadPortfolioData());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    final key = switch (section) {
      'About' => _heroKey,
      'Skills' => _skillsKey,
      'Projects' => _projectsKey,
      'Experience' => _experienceKey,
      'Contact' => _contactKey,
      _ => _heroKey,
    };

    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Scaffold(
      backgroundColor: colors.background,
      body: Column(
        children: [
          NavBar(onNavTap: _scrollToSection),
          Expanded(
            child: BlocBuilder<PortfolioBloc, PortfolioState>(
              builder: (context, state) {
                if (state is PortfolioLoading || state is PortfolioInitial) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppTheme.primary),
                  );
                }

                if (state is PortfolioError) {
                  return Center(
                    child: Text(state.message,
                        style: const TextStyle(color: AppTheme.accent)),
                  );
                }

                if (state is PortfolioLoaded) {
                  return SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        HeroSection(
                            key: _heroKey,
                            onViewProjects: () => _scrollToSection('Projects')),
                        SkillsSection(key: _skillsKey, skills: state.skills),
                        ProjectsSection(
                            key: _projectsKey, projects: state.projects),
                        ExperienceSection(
                            key: _experienceKey,
                            experiences: state.experiences),
                        ContactSection(key: _contactKey),
                        const FooterSection(),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
