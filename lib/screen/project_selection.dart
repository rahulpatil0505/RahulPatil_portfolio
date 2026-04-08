import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'portfolio_data.dart';
import 'project_dtail_screen.dart';
import 'wedget/header.dart';


class ProjectSection extends StatelessWidget {
  final bool isWide;
  const ProjectSection({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          index: '04',
          title: 'Projects',
          subtitle: "Apps I've designed and built",
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isWide ? 2 : 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: isWide ? 240 : 220, // fixed height, no overflow
          ),
          itemCount: PortfolioData.projects.length,
          itemBuilder: (context, i) {
            final p = PortfolioData.projects[i];
            return ProjectCard(
              title: p.title,
              desc: p.desc,
              longDesc: p.longDesc,
              tags: p.tags,
              emoji: p.emoji,
              status: p.status,
              liveUrlIos: p.liveUrlIOS,
              liveUrl: p.liveUrl,
            );
          },
        ),
      ],
    );
  }
}

// ── Project Card ──────────────────────────────────────────────────────────────
class ProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final String longDesc;
  final List<String> tags;
  final String emoji;
  final String status;
  final String liveUrlIos;
  final String liveUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.desc,
    required this.longDesc,
    required this.tags,
    required this.emoji,
    required this.status,
    required this.liveUrlIos,
    required this.liveUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  void _openDetail(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, __) => FadeTransition(
          opacity: animation,
          child: ProjectDetailScreen(
            title: widget.title,
            longDesc: widget.longDesc,
            tags: widget.tags,
            emoji: widget.emoji,
            status: widget.status,
            liveUrlIos: widget.liveUrlIos,
            liveUrl: widget.liveUrl,
          ),
        ),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = context.isDark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => _openDetail(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.identity()..translate(0.0, _hovered ? -4.0 : 0.0),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: dark
                ? (_hovered ? const Color(0xFF141922) : const Color(0xFF111318))
                : (_hovered ? const Color(0xFFFAFFFE) : Colors.white),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _hovered
                  ? context.accent.withAlpha(120)
                  : (dark
                        ? Colors.white.withAlpha(12)
                        : Colors.black.withAlpha(8)),
            ),
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? context.accent.withAlpha(40)
                    : Colors.black.withAlpha(dark ? 60 : 10),
                blurRadius: _hovered ? 32 : 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Emoji + status row ──────────────────────────────────
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: context.accent.withAlpha(15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: context.accent.withAlpha(40)),
                      image: DecorationImage(
                        image: AssetImage(widget.emoji),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Spacer(),
                  _StatusBadge(status: widget.status, context: context),
                ],
              ),
              const SizedBox(height: 10),
              // ── Title: max 1 line with ellipsis ─────────────────────
              Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 6),
              // ── Description: always 2 lines visible ─────────────────
              Text(
                widget.desc,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.textMuted,
                  fontSize: 12,
                  height: 1.55,
                ),
              ),
              const SizedBox(height: 12),
              // ── Tags + arrow ─────────────────────────────────────────
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 0, // single line only
                      children: widget.tags
                          .take(3) // max 3 tags to avoid overflow
                          .map(
                            (tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: dark
                                    ? Colors.white.withAlpha(8)
                                    : Colors.black.withAlpha(6),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  color: context.primary.withAlpha(160),
                                  fontFamily: 'Courier',
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  AnimatedOpacity(
                    opacity: _hovered ? 1.0 : 0.4,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: context.accent.withAlpha(20),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: context.accent,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  final BuildContext context;

  const _StatusBadge({required this.status, required this.context});

  @override
  Widget build(BuildContext ctx) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: ctx.accent.withAlpha(15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ctx.accent.withAlpha(40)),
      ),
      child: Text(
        status,
        style: const TextStyle(fontFamily: 'Courier', fontSize: 11),
      ),
    );
  }
}
