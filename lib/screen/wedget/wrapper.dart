import 'package:flutter/material.dart';

import '../../core/app_constants.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;

  const SectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isWide =
        MediaQuery.of(context).size.width > AppConstants.wideBreakpoint;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppConstants.sectionVerticalPadding,
        horizontal: isWide
            ? AppConstants.sectionHorizontalPaddingWide
            : AppConstants.sectionHorizontalPaddingMobile,
      ),
      child: child,
    );
  }
}
