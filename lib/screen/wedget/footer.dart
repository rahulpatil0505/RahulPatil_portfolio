import 'package:flutter/material.dart';

import '../../core/theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              'R P',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.accent,
                fontFamily: 'Courier',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              '© 2026 · Crafted with Flutter · Proudly Made in India 🇮🇳',
              textAlign: TextAlign.end,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: TextStyle(
                color: context.textMuted,
                fontFamily: 'Courier',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
