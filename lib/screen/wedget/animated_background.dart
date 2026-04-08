import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedBackground extends StatelessWidget {
  final AnimationController controller;
  const AnimatedBackground({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) => CustomPaint(
        painter: _MeshPainter(progress: controller.value, isDark: isDark),
        size: Size.infinite,
      ),
    );
  }
}

class _MeshPainter extends CustomPainter {
  final double progress;
  final bool isDark;

  _MeshPainter({required this.progress, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final t = progress * 2 * math.pi;

    void blob(double cx, double cy, double r, Color color) {
      paint.color = color;
      canvas.drawCircle(Offset(cx * size.width, cy * size.height), r, paint);
    }

    if (isDark) {
      blob(0.1 + 0.05 * math.sin(t), 0.2 + 0.05 * math.cos(t), 220,
          const Color(0xFF00C2A8).withAlpha(18));
      blob(0.85 + 0.04 * math.cos(t * 0.7), 0.15 + 0.04 * math.sin(t * 0.7),
          180, const Color(0xFF6366F1).withAlpha(14));
      blob(0.5 + 0.06 * math.sin(t * 1.3), 0.7 + 0.04 * math.cos(t * 1.3),
          260, const Color(0xFF00C2A8).withAlpha(10));
      blob(0.9 + 0.03 * math.sin(t * 0.5), 0.85, 160,
          const Color(0xFFFF6B35).withAlpha(12));
    } else {
      blob(0.1 + 0.05 * math.sin(t), 0.2 + 0.05 * math.cos(t), 280,
          const Color(0xFF00C2A8).withAlpha(22));
      blob(0.85 + 0.04 * math.cos(t * 0.7), 0.15 + 0.04 * math.sin(t * 0.7),
          220, const Color(0xFF6366F1).withAlpha(18));
      blob(0.5 + 0.06 * math.sin(t * 1.3), 0.75 + 0.04 * math.cos(t * 1.3),
          300, const Color(0xFF00C2A8).withAlpha(14));
    }
  }

  @override
  bool shouldRepaint(_MeshPainter old) =>
      old.progress != progress || old.isDark != isDark;
}
