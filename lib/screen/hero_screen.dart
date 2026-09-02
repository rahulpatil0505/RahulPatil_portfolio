import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'portfolio_data.dart';


import '../../core/utils/cv_downloader.dart';

class HeroSection extends StatefulWidget {
  final bool isWide;
  final VoidCallback? onScrollToProjects;

  const HeroSection({super.key, required this.isWide, this.onScrollToProjects});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(minHeight: size.height * 0.88),
      padding: EdgeInsets.symmetric(
        horizontal: widget.isWide ? 80 : 28,
        vertical: widget.isWide ? 60 : 40,
      ),
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AvailableBadge(context),
              const SizedBox(height: 20),
              _MainHeading(context, widget.isWide),
              const SizedBox(height: 14),
              _SubtitleBar(context),
              const SizedBox(height: 20),
              // Description text like the screenshot
              Text(
                'Crafting pixel-perfect experiences for Android & iOS.\nSpecialized in Flutter, Firebase, BLoC, REST APIs,\nand production-grade mobile ecosystems.',
                style: TextStyle(
                  color: context.primary.withAlpha(130),
                  fontSize: widget.isWide ? 15 : 13,
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 36),
              _CTAButtons(context),
              const SizedBox(height: 48),
              _StatsRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _AvailableBadge(BuildContext context) => FittedBox(
    fit: BoxFit.scaleDown,
    alignment: Alignment.centerLeft,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: context.accent.withAlpha(120), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: context.accent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: context.accent.withAlpha(160),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Flutter Developer',
            style: TextStyle(
              color: context.accent,
              fontFamily: 'Courier',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Text(
          //     '·',
          //     style: TextStyle(
          //       color: context.accent.withAlpha(100),
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 3,
              height: 3,
              decoration: BoxDecoration(
                color: context.accent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Text(
            'Available for Work',
            style: TextStyle(
              color: context.accent,
              fontFamily: 'Courier',
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _MainHeading(BuildContext context, bool isWide) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // ── Giant name — 70% width on web, full width on mobile ───────
      LayoutBuilder(
        builder: (context, constraints) {
          final nameWidth = isWide
              ? constraints.maxWidth * 0.70
              : constraints.maxWidth;
          return SizedBox(
            width: nameWidth,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              alignment: Alignment.centerLeft,
              child: Text(
                'RAHUL', // ← your first name here
                style: TextStyle(
                  color: context.primary,
                  fontSize: 200,
                  fontWeight: FontWeight.w900,
                  height: 0.9,
                  letterSpacing: -6,
                ),
              ),
            ),
          );
        },
      ),
      const SizedBox(height: 4),
      // ── Surname outline — same width constraint ───────────────────
      LayoutBuilder(
        builder: (context, constraints) {
          final nameWidth = isWide
              ? constraints.maxWidth * 0.70
              : constraints.maxWidth;
          return SizedBox(
            width: nameWidth,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              alignment: Alignment.centerLeft,
              child: Text(
                'PATIL.', // ← your surname here
                style: TextStyle(
                  // Hollow/outline style — do NOT set color alongside foreground
                  fontSize: 200,
                  fontWeight: FontWeight.w900,
                  height: 0.9,
                  letterSpacing: -6,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1.5
                    ..color = context.primary.withAlpha(60),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );

  Widget _SubtitleBar(BuildContext context) => Row(
    children: [
      // Left dash
      Container(width: 40, height: 1.5, color: context.accent.withAlpha(180)),
      const SizedBox(width: 12),
      Flexible(
        child: Text(
          '${widget.isWide ? '3+' : ''} YEARS BUILDING FLUTTER EXCELLENCE',
          style: TextStyle(
            color: context.accent,
            fontFamily: 'Courier',
            fontSize: widget.isWide ? 13 : 10,
            fontWeight: FontWeight.bold,
            letterSpacing: widget.isWide ? 3 : 2,
          ),
        ),
      ),
      const SizedBox(width: 12),
      // Right dash
      Container(width: 40, height: 1.5, color: context.accent.withAlpha(180)),
    ],
  );

  Widget _CTAButtons(BuildContext context) => Wrap(
    spacing: 16,
    runSpacing: 12,
    children: [
      HeroButton(
        label: 'View Projects',
        filled: true,
        onTap: widget.onScrollToProjects,
      ),
      HeroButton(
        label: 'Download CV',
        filled: false,
        onTap: () => downloadCv(context),
      ),
    ],
  );

  Widget _StatsRow(BuildContext context) => Wrap(
    spacing: 32,
    runSpacing: 20,
    children: PortfolioData.heroStats
        .map((s) => _StatItem(s.$1, s.$2, context))
        .toList(),
  );

  Widget _StatItem(String value, String label, BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        value,
        style: TextStyle(
          color: context.accent,
          fontSize: 32,
          fontWeight: FontWeight.w900,
          fontFamily: 'Courier',
          letterSpacing: -1,
        ),
      ),
      Text(
        label,
        style: TextStyle(
          color: context.textMuted,
          fontSize: 12,
          fontFamily: 'Courier',
          letterSpacing: 0.5,
        ),
      ),
    ],
  );
}

// ── Hero Button ───────────────────────────────────────────────────────────────
class HeroButton extends StatefulWidget {
  final String label;
  final bool filled;
  final VoidCallback? onTap;

  const HeroButton({
    super.key,
    required this.label,
    required this.filled,
    this.onTap,
  });

  @override
  State<HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<HeroButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final accent = context.accent;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.filled
              ? (_hover ? accent.withAlpha(220) : accent)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: accent, width: 1.5),
          boxShadow: widget.filled && _hover
              ? [
                  BoxShadow(
                    color: accent.withAlpha(60),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              child: Text(
                widget.label,
                style: TextStyle(
                  color: widget.filled ? Colors.white : accent,
                  fontFamily: 'Courier',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
