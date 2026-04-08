import 'package:flutter/material.dart';

import '../core/theme.dart';

import 'portfolio_data.dart';
import 'wedget/header.dart';

class AboutSection extends StatelessWidget {
  final bool isWide;
  const AboutSection({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          index: '01',
          title: 'About Me',
          subtitle: 'Who I am and what I do',
        ),
        if (isWide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: _AboutText(context)),
              const SizedBox(width: 60),
              Expanded(flex: 2, child: _QuickFactsCard(context)),
            ],
          )
        else ...[
          _AboutText(context),
          const SizedBox(height: 32),
          _QuickFactsCard(context),
        ],
      ],
    );
  }

  Widget _AboutText(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Flutter Developer with 2.5 + years of experience in building high-performance, scalable mobile applications for Android and iOS. Strong expertise in Flutter, Dart, BLoC state management, Firebase integration, REST APIs, and clean architecture. Experienced in developing CRM and lead management apps with features like authentication, push notifications, file handling, and native Android integrations. Passionate about writing clean, maintainable code and delivering smooth user experiences.',
        style: TextStyle(
          color: context.primary.withAlpha(200),
          fontSize: 17,
          height: 1.8,
          letterSpacing: 0.2,
        ),
      ),
      const SizedBox(height: 24),
      Text(
        'I specialise in architecting scalable apps using the BLoC pattern, building offline-first experiences, and integrating third-party services seamlessly — always with clean, maintainable code.',
        style: TextStyle(color: context.textMuted, fontSize: 15, height: 1.8),
      ),
    ],
  );

  Widget _QuickFactsCard(BuildContext context) {
    final bool dark = context.isDark;
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF111318) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: dark ? Colors.white.withAlpha(12) : Colors.black.withAlpha(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(dark ? 60 : 12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Facts',
            style: TextStyle(
              color: context.accent,
              fontFamily: 'Courier',
              fontSize: 12,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...PortfolioData.quickFacts.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  Text(e.$1, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      e.$2,
                      style: TextStyle(
                        color: context.primary.withAlpha(180),
                        fontFamily: 'Courier',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
