import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/theme.dart';

import 'portfolio_data.dart';
import 'wedget/header.dart';

class ContactSection extends StatelessWidget {
  final bool isWide;
  const ContactSection({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          index: '05',
          title: 'Contact',
          subtitle: "Let's build something amazing together",
        ),
        if (isWide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: _ContactLinks(context)),
              const SizedBox(width: 60),
              Expanded(flex: 2, child: _Thankyounote(context)),
              // Expanded(flex: 3, child: ContactForm(context)),
            ],
          )
        else ...[
          _ContactLinks(context),
          const SizedBox(height: 20),
          _Thankyounote(context),
          // ContactForm(context),
        ],
      ],
    );
  }

  Widget _ContactLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Feel free to reach out — I'm always open to discussing new projects, creative ideas, or opportunities.",
          style: TextStyle(color: context.textMuted, fontSize: 15, height: 1.7),
        ),
        const SizedBox(height: 32),
        ...PortfolioData.contactLinks.map(
          (e) => _ContactLinkTile(
            emoji: e.$1,
            label: e.$2,
            displayText: e.$3,
            url: e.$4,
          ),
        ),
      ],
    );
  }
}

// ------- Thank you note --------------------------

Widget _Thankyounote(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Thank you for taking the time to explore my portfolio! If you have any questions, want to collaborate, or just want to say hi, don't hesitate to reach out. I'm always excited to connect with fellow creatives and professionals. Let's create something amazing together!",
        style: TextStyle(color: context.textMuted, fontSize: 20, height: 2.7),
      ),
    ],
  );
}

// ── Contact Form ──────────────────────────────────────────────────────────────
class ContactForm extends StatelessWidget {
  final BuildContext parentContext;

  const ContactForm(this.parentContext, {super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = context.isDark;
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: dark ? const Color(0xFF111318) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: dark ? Colors.white.withAlpha(12) : Colors.black.withAlpha(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(dark ? 60 : 10),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          FormField(label: 'Name', hint: 'Your full name'),
          const SizedBox(height: 16),
          FormField(label: 'Email', hint: 'your@email.com'),
          const SizedBox(height: 16),
          FormField(
            label: 'Message',
            hint: 'Tell me about your project...',
            maxLines: 4,
          ),
          const SizedBox(height: 24),
          _SendButton(context),
        ],
      ),
    );
  }

  Widget _SendButton(BuildContext context) => SizedBox(
    width: double.infinity,
    child: Container(
      decoration: BoxDecoration(
        color: context.accent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.accent.withAlpha(60),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Send Message →',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
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

// ── Reusable Form Field ───────────────────────────────────────────────────────
class FormField extends StatelessWidget {
  final String label;
  final String hint;
  final int maxLines;

  const FormField({
    super.key,
    required this.label,
    required this.hint,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = context.isDark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: context.accent,
            fontFamily: 'Courier',
            fontSize: 11,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          style: TextStyle(
            color: context.primary,
            fontFamily: 'Courier',
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: context.textMuted,
              fontFamily: 'Courier',
              fontSize: 13,
            ),
            filled: true,
            fillColor: dark
                ? Colors.white.withAlpha(5)
                : Colors.black.withAlpha(4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: dark
                    ? Colors.white.withAlpha(15)
                    : Colors.black.withAlpha(12),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: dark
                    ? Colors.white.withAlpha(15)
                    : Colors.black.withAlpha(12),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: context.accent, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactLinkTile extends StatefulWidget {
  final String emoji;
  final String label;
  final String displayText;
  final String url;

  const _ContactLinkTile({
    required this.emoji,
    required this.label,
    required this.displayText,
    required this.url,
  });

  @override
  State<_ContactLinkTile> createState() => _ContactLinkTileState();
}

class _ContactLinkTileState extends State<_ContactLinkTile> {
  bool _hover = false;

  Future<void> _launch() async {
    final uri = Uri.parse(widget.url);
    try {
      final launched = await launchUrl(
        uri,
        // mailto → let OS pick the email app
        // https  → open in browser
        mode: widget.url.startsWith('mailto')
            ? LaunchMode.externalApplication
            : LaunchMode.externalApplication,
      );
      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Could not open: ${widget.displayText}',
              style: const TextStyle(fontFamily: 'Courier'),
            ),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error: $e',
              style: const TextStyle(fontFamily: 'Courier'),
            ),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: _launch,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: _hover ? context.accent.withAlpha(12) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _hover
                    ? context.accent.withAlpha(60)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.emoji, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: TextStyle(
                        color: context.accent,
                        fontFamily: 'Courier',
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      widget.displayText,
                      style: TextStyle(
                        color: _hover
                            ? context.accent
                            : context.primary.withAlpha(180),
                        fontFamily: 'Courier',
                        fontSize: 13,
                        decoration: _hover ? TextDecoration.underline : null,
                        decorationColor: context.accent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                AnimatedOpacity(
                  opacity: _hover ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 180),
                  child: Icon(
                    Icons.open_in_new_rounded,
                    size: 14,
                    color: context.accent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
