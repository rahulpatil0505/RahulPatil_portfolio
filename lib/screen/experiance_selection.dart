import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'portfolio_data.dart';

class ExperienceSection extends StatelessWidget {
  final bool isWide;
  const ExperienceSection({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section heading ──────────────────────────────────────────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '// 03',
              style: TextStyle(
                color: context.accent,
                fontFamily: 'Courier',
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'WORK ',
                    style: TextStyle(
                      color: context.primary,
                      fontSize: isWide ? 42 : 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                      height: 1.1,
                    ),
                  ),
                  TextSpan(
                    text: 'EXPERIENCE',
                    style: TextStyle(
                      color: context.primary,

                      fontSize: isWide ? 42 : 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: 48,
              height: 3,
              decoration: BoxDecoration(
                color: context.accent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),

        // ── Timeline ────────────────────────────────────────────────────
        ...List.generate(PortfolioData.experience.length, (i) {
          final e = PortfolioData.experience[i];
          final isLast = i == PortfolioData.experience.length - 1;
          return _TimelineItem(
            role: e.role,
            company: e.company,
            location: e.location,
            period: e.period,
            points: e.points,
            isLast: isLast,
            isWide: isWide,
            index: i,
          );
        }),
      ],
    );
  }
}

// ── Timeline Item ─────────────────────────────────────────────────────────────
class _TimelineItem extends StatefulWidget {
  final String role, company, location, period;
  final List<String> points;
  final bool isLast, isWide;
  final int index;

  const _TimelineItem({
    required this.role,
    required this.company,
    required this.location,
    required this.period,
    required this.points,
    required this.isLast,
    required this.isWide,
    required this.index,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(-0.05, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    Future.delayed(Duration(milliseconds: 200 + widget.index * 150), () {
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
    final bool dark = context.isDark;

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Left timeline rail ──────────────────────────────────
              SizedBox(
                width: 36,
                child: Column(
                  children: [
                    // Dot
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.bg,
                        border: Border.all(color: context.accent, width: 2.5),
                        boxShadow: [
                          BoxShadow(
                            color: context.accent.withAlpha(80),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    // Vertical line below dot
                    if (!widget.isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                context.accent.withAlpha(180),
                                context.accent.withAlpha(20),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // ── Card ─────────────────────────────────────────────────
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 28),
                  child: Container(
                    padding: EdgeInsets.all(widget.isWide ? 28 : 20),
                    decoration: BoxDecoration(
                      color: dark ? const Color(0xFF111318) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: dark
                            ? Colors.white.withAlpha(12)
                            : Colors.black.withAlpha(8),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(dark ? 50 : 8),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Role + period row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.role,
                                style: TextStyle(
                                  color: context.primary,
                                  fontSize: widget.isWide ? 18 : 16,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Period badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: context.accent.withAlpha(15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: context.accent.withAlpha(60),
                                ),
                              ),
                              child: Text(
                                widget.period,
                                style: TextStyle(
                                  color: context.accent,
                                  fontFamily: 'Courier',
                                  fontSize: 11,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),

                        // Company + location
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 1.5,
                              color: context.accent,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                '${widget.company} · ${widget.location}',
                                style: TextStyle(
                                  color: context.accent,
                                  fontFamily: 'Courier',
                                  fontSize: 12,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Bullet points
                        ...widget.points.map(
                          (point) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 10,
                                    color: context.accent,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    point,
                                    style: TextStyle(
                                      color: context.primary.withAlpha(180),
                                      fontSize: 13,
                                      height: 1.6,
                                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
