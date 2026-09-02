import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core/theme.dart';

import 'portfolio_data.dart';
import 'wedget/header.dart';

// class SkillsSection extends StatelessWidget {
//   final bool isWide;
//   const SkillsSection({super.key, required this.isWide});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SectionHeading(
//           index: '02',
//           title: 'Skills',
//           subtitle: 'Technologies I work with daily',
//         ),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: isWide ? 4 : 2,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//             childAspectRatio: isWide ? 1.5 : 1.4,
//           ),
//           itemCount: PortfolioData.skills.length,
//           itemBuilder: (context, i) {
//             final skill = PortfolioData.skills[i];
//             return SkillCard(
//               name: skill.name,
//               percent: skill.percent,
//               emoji: skill.emoji,
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// // ── Skill Card ────────────────────────────────────────────────────────────────
// class SkillCard extends StatefulWidget {
//   final String name;
//   final int percent;
//   final String emoji;

//   const SkillCard({
//     super.key,
//     required this.name,
//     required this.percent,
//     required this.emoji,
//   });

//   @override
//   State<SkillCard> createState() => _SkillCardState();
// }

// class _SkillCardState extends State<SkillCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _ctrl;
//   late Animation<double> _anim;
//   bool _hovered = false;

//   @override
//   void initState() {
//     super.initState();
//     _ctrl = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     );
//     _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
//     Future.delayed(const Duration(milliseconds: 500), () {
//       if (mounted) _ctrl.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _ctrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool dark = context.isDark;

//     return MouseRegion(
//       onEnter: (_) => setState(() => _hovered = true),
//       onExit: (_) => setState(() => _hovered = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: dark
//               ? (_hovered ? const Color(0xFF1A1F2E) : const Color(0xFF111318))
//               : (_hovered ? const Color(0xFFF8FFFE) : Colors.white),
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: _hovered
//                 ? context.accent.withAlpha(100)
//                 : (dark
//                       ? Colors.white.withAlpha(12)
//                       : Colors.black.withAlpha(8)),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: _hovered
//                   ? context.accent.withAlpha(30)
//                   : Colors.black.withAlpha(dark ? 40 : 8),
//               blurRadius: _hovered ? 20 : 12,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             // Emoji — shrinks if space is tight
//             Container(
//               width: MediaQuery.sizeOf(context).width * 0.08,
//               height: MediaQuery.sizeOf(context).height * 0.08,
//               decoration: BoxDecoration(
//                 color: context.accent.withAlpha(15),
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: context.accent.withAlpha(40)),
//                 image: DecorationImage(
//                   image: AssetImage(widget.emoji),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             // Name
//             Text(
//               widget.name,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 color: context.primary,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12,
//                 fontFamily: 'Courier',
//               ),
//             ),
//             const SizedBox(height: 6),
//             // Animated progress bar + percentage
//             AnimatedBuilder(
//               animation: _anim,
//               builder: (_, __) => Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(4),
//                     child: LinearProgressIndicator(
//                       value: _anim.value * widget.percent / 100,
//                       minHeight: 3,
//                       backgroundColor: dark
//                           ? Colors.white.withAlpha(15)
//                           : Colors.black.withAlpha(10),
//                       valueColor: AlwaysStoppedAnimation<Color>(context.accent),
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                   Text(
//                     '${(widget.percent * _anim.value).toInt()}%',
//                     style: TextStyle(
//                       color: context.accent,
//                       fontFamily: 'Courier',
//                       fontSize: 10,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SkillsSection extends StatelessWidget {
  final bool isWide;
  const SkillsSection({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          index: '02',
          title: 'Skills',
          subtitle: 'Technologies I work with daily',
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isWide ? 4 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isWide ? 1.5 : 1.4,
          ),
          itemCount: PortfolioData.skills.length,
          itemBuilder: (context, i) {
            final skill = PortfolioData.skills[i];
            return SkillCard(
              name: skill.name,
              percent: skill.percent,
              emoji: skill.emoji,
            );
          },
        ),
      ],
    );
  }
}

// ── Skill Card ────────────────────────────────────────────────────────────────
class SkillCard extends StatefulWidget {
  final String name;
  final int percent;
  final String emoji;

  const SkillCard({
    super.key,
    required this.name,
    required this.percent,
    required this.emoji,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _hovered = false;

  // True if the emoji path is a Lottie JSON file
  bool get _isLottie => widget.emoji.toLowerCase().endsWith('.json');
  // True if it's any image asset (png/jpg/webp etc.)
  bool get _isAsset =>
      widget.emoji.startsWith('assets/') || widget.emoji.startsWith('Assets/');

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  // ── Icon area: Lottie / PNG / emoji fallback ──────────────────────────────
  Widget _buildIcon() {
    if (_isLottie) {
      // Lottie JSON animation — loops automatically
      return Lottie.asset(
        widget.emoji,
        width: 44,
        height: 44,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.animation_rounded, size: 36, color: Colors.grey),
      );
    }

    if (_isAsset) {
      // Static image asset (png / jpg / webp)
      return Image.asset(
        widget.emoji,
        width: 44,
        height: 44,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const Icon(
          Icons.broken_image_outlined,
          size: 36,
          color: Colors.grey,
        ),
      );
    }

    // Plain emoji string fallback
    return Text(widget.emoji, style: const TextStyle(fontSize: 28));
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = context.isDark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: dark
              ? (_hovered ? const Color(0xFF1A1F2E) : const Color(0xFF111318))
              : (_hovered ? const Color(0xFFF8FFFE) : Colors.white),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? context.accent.withAlpha(100)
                : (dark
                      ? Colors.white.withAlpha(12)
                      : Colors.black.withAlpha(8)),
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered
                  ? context.accent.withAlpha(30)
                  : Colors.black.withAlpha(dark ? 40 : 8),
              blurRadius: _hovered ? 20 : 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // ── Icon (Lottie / image / emoji) ──────────────────────────
            _buildIcon(),
            const Spacer(),
            // ── Skill name ─────────────────────────────────────────────
            Text(
              widget.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.primary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                fontFamily: 'Courier',
              ),
            ),
            const SizedBox(height: 6),
            // // ── Animated progress bar + percentage ─────────────────────
            // AnimatedBuilder(
            //   animation: _anim,
            //   builder: (_, __) => Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(4),
            //         child: LinearProgressIndicator(
            //           value: _anim.value * widget.percent / 100,
            //           minHeight: 3,
            //           backgroundColor: dark
            //               ? Colors.white.withAlpha(15)
            //               : Colors.black.withAlpha(10),
            //           valueColor: AlwaysStoppedAnimation<Color>(context.accent),
            //         ),
            //       ),
            //       const SizedBox(height: 3),
            //       Text(
            //         '${(widget.percent * _anim.value).toInt()}%',
            //         style: TextStyle(
            //           color: context.accent,
            //           fontFamily: 'Courier',
            //           fontSize: 10,
            //         ),
            //       ),
            //     ],
              // ),
            // ),
          ],
        ),
      ),
    );
  }
}
