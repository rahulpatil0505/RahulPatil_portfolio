import 'package:flutter/material.dart';

import '../../core/theme.dart';


class SectionHeading extends StatelessWidget {
  final String index;
  final String title;
  final String subtitle;

  const SectionHeading({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '// $index',
          style: TextStyle(
            color: context.accent,
            fontFamily: 'Courier',
            fontSize: 12,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: context.primary,
            fontSize: 38,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
            height: 1.1,
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
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: TextStyle(
            color: context.textMuted,
            fontFamily: 'Courier',
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
