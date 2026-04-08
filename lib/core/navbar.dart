import 'package:flutter/material.dart';

import 'theme.dart';

class NavBar extends StatelessWidget {
  final bool isWide;
  final bool isDark;
  final VoidCallback onToggleTheme;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
   final VoidCallback onExperience;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const NavBar({
    super.key,
    required this.isWide,
    required this.isDark,
    required this.onToggleTheme,
    required this.onAbout,
    required this.onSkills,
    required this.onExperience,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = context.isDark;

    return Container(
      height: isWide ? 64 : 60,
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      decoration: BoxDecoration(
        color: dark
            ? const Color(0xFF111318).withAlpha(200)
            : Colors.white.withAlpha(200),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: dark ? Colors.white.withAlpha(15) : Colors.black.withAlpha(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(dark ? 80 : 30),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // Logo
              Text(
                isWide ? ' RAHUL PATIL ' : 'RAHUL PATIL',
                style: TextStyle(
                  color: context.accent,
                  fontFamily: 'Courier',
                  fontWeight: FontWeight.bold,
                  fontSize: isWide ? 15 : 13,
                  letterSpacing: 1,
                ),
              ),
              const Spacer(),
              if (isWide) ...[
                _NavItem('About', onAbout, context),
                _NavItem('Skills', onSkills, context),
                _NavItem('Experience', onExperience, context),
                _NavItem('Projects', onProjects, context),
                _NavItem('Contact', onContact, context),
                const SizedBox(width: 8),
              ],
              // Theme toggle
              _ThemeToggle(
                dark: dark,
                onToggle: onToggleTheme,
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _NavItem(String label, VoidCallback onTap, BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: context.primary.withAlpha(160),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Courier',
          fontSize: 13,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  final bool dark;
  final VoidCallback onToggle;
  final BuildContext context;

  const _ThemeToggle({
    required this.dark,
    required this.onToggle,
    required this.context,
  });

  @override
  Widget build(BuildContext ctx) {
    return GestureDetector(
      onTap: onToggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 44,
        height: 24,
        decoration: BoxDecoration(
          color: dark ? const Color(0xFF1E2330) : const Color(0xFFE5E7EB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ctx.accent.withAlpha(80)),
        ),
        child: AnimatedAlign(
          alignment: dark ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: ctx.accent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              dark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              size: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
