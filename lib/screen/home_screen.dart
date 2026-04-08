import 'package:flutter/material.dart';
import 'package:rahul_portfolio/screen/experiance_selection.dart'
    hide ExperienceSection;
import 'package:rahul_portfolio/screen/project_selection.dart';

import '../core/app_constants.dart';
import '../core/navbar.dart';
import 'about_screen.dart';
import 'contact_screen.dart';
import 'experiance_selection.dart';
import 'hero_screen.dart';

import 'skill_screen.dart';
import 'wedget/animated_background.dart';
import 'wedget/footer.dart';
import 'wedget/wrapper.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomeScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  late AnimationController _bgController;
  // bool _isNavVisible = true;
  // double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      setState(() {
        // _isNavVisible = offset < _lastOffset || offset < 100;
        // _lastOffset = offset;
      });
    });
  }

  @override
  void dispose() {
    _bgController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide =
        MediaQuery.of(context).size.width > AppConstants.wideBreakpoint;

    return Scaffold(
      body: Stack(
        children: [
          // Animated mesh background
          AnimatedBackground(controller: _bgController),

          // Scrollable content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: isWide ? 80 : 70)),
              SliverToBoxAdapter(
                child: HeroSection(
                  isWide: isWide,
                  onScrollToProjects: () => _scrollTo(projectKey),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionWrapper(
                  key: aboutKey,
                  child: AboutSection(isWide: isWide),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionWrapper(
                  key: skillsKey,
                  child: SkillsSection(isWide: isWide),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionWrapper(
                  key: experienceKey,
                  child: ExperienceSection(isWide: isWide),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionWrapper(
                  key: projectKey,
                  child: ProjectSection(isWide: isWide),
                ),
              ),
              SliverToBoxAdapter(
                child: SectionWrapper(
                  key: contactKey,
                  child: ContactSection(isWide: isWide),
                ),
              ),
              const SliverToBoxAdapter(child: Footer()),
            ],
          ),

          // Floating nav bar
          NavBar(
            isWide: isWide,
            isDark: widget.isDark,
            onToggleTheme: widget.onToggleTheme,
            onAbout: () => _scrollTo(aboutKey),
            onSkills: () => _scrollTo(skillsKey),
            onExperience: () => _scrollTo(experienceKey),
            onProjects: () => _scrollTo(projectKey),
            onContact: () => _scrollTo(contactKey),
          ),
        ],
      ),
    );
  }
}
