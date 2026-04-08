import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/theme.dart';


class ProjectDetailScreen extends StatelessWidget {
  final String title;
  final String longDesc;
  final List<String> tags;
  final String emoji;
  final String status;
  final String liveUrlIos;
  final String liveUrl;

  const ProjectDetailScreen({
    super.key,
    required this.title,
    required this.longDesc,
    required this.tags,
    required this.emoji,
    required this.status,
    required this.liveUrlIos,
    required this.liveUrl,
  });

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = context.isDark;
    final isWide = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.primary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '$title',
          style: TextStyle(
            color: context.accent,
            fontFamily: 'Courier',
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? 80 : 24,
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero row ─────────────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Big emoji badge
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: context.accent.withAlpha(15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: context.accent.withAlpha(40)),
                    image: DecorationImage(
                      image: AssetImage(emoji),
                      fit: BoxFit.fill,
                    ),
                  ),
                  
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: context.primary,
                          fontSize: isWide ? 32 : 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.8,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _StatusBadge(status: status, context: context),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),

            // ── Divider ──────────────────────────────────────────────────
            Container(
              height: 1,
              color: dark
                  ? Colors.white.withAlpha(12)
                  : Colors.black.withAlpha(8),
            ),
            const SizedBox(height: 32),

            // ── About label ──────────────────────────────────────────────
            Text(
              '// about this project',
              style: TextStyle(
                color: context.accent,
                fontFamily: 'Courier',
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 16),

            // ── Long description ─────────────────────────────────────────
            Text(
              longDesc,
              style: TextStyle(
                color: context.primary.withAlpha(200),
                fontSize: 16,
                height: 1.85,
              ),
            ),
            const SizedBox(height: 36),

            // ── Tech stack ───────────────────────────────────────────────
            Text(
              '// tech stack',
              style: TextStyle(
                color: context.accent,
                fontFamily: 'Courier',
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: tags.map((tag) => _Tag(tag: tag)).toList(),
            ),
            const SizedBox(height: 40),

            // ── Action buttons ───────────────────────────────────────────
            Text(
              '// links',
              style: TextStyle(
                color: context.accent,
                fontFamily: 'Courier',
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                if (liveUrl.isNotEmpty)
                  _LinkButton(
                    label: 'Playstore',
                    icon: Icon(Icons.android_rounded, size: 16),
                    filled: true,
                    onTap: () => _launch(liveUrl),
                  ),
                if (liveUrl.isEmpty)
                  Text(
                    'Links coming soon...',
                    style: TextStyle(
                      color: context.textMuted,
                      fontFamily: 'Courier',
                      fontSize: 13,
                    ),
                  ),
                if (liveUrlIos.isNotEmpty)
                  _LinkButton(
                    label: 'AppStore',
                    icon: Icon(Icons.apple_rounded, size: 16),
                    filled: true,
                    onTap: () => _launch(liveUrlIos),
                  ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

// ── Widgets ───────────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final String status;
  final BuildContext context;
  const _StatusBadge({required this.status, required this.context});

  @override
  Widget build(BuildContext ctx) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: ctx.accent.withAlpha(15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ctx.accent.withAlpha(50)),
      ),
      child: Text(
        status,
        style: const TextStyle(fontFamily: 'Courier', fontSize: 12),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String tag;
  const _Tag({required this.tag});

  @override
  Widget build(BuildContext context) {
    final bool dark = context.isDark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: dark ? Colors.white.withAlpha(10) : Colors.black.withAlpha(6),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: dark ? Colors.white.withAlpha(15) : Colors.black.withAlpha(10),
        ),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: context.primary.withAlpha(180),
          fontFamily: 'Courier',
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _LinkButton extends StatefulWidget {
  final String label;
  final Icon icon;
  final bool filled;
  final VoidCallback onTap;

  const _LinkButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final accent = context.accent;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
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
                    blurRadius: 18,
                    spreadRadius: 1,
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.icon,

                  const SizedBox(width: 8),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: widget.filled ? Colors.white : accent,
                      fontFamily: 'Courier',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
