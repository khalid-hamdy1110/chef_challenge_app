import 'package:flutter/material.dart';

// These values are used to determine the screen type.
const double mobileBreakpoint = 834;
const double tabletBreakpoint = 1000;

// --- Screen Type Enum ---
// A simple enum to make the screen type explicit and readable.
enum ScreenType { mobile, tablet, desktop }

// --- 3. Screen Type Helper Function ---
// A utility function that returns the current screen type based on the width.
ScreenType getScreenType(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < mobileBreakpoint) {
    return ScreenType.mobile;
  } else if (screenWidth < tabletBreakpoint) {
    return ScreenType.tablet;
  } else {
    return ScreenType.desktop;
  }
}

// --- Generic Adaptive Value Function ---
// This function returns a value of type T based on the current screen type.
// It provides a fallback mechanism, using the mobile value if the tablet
// value is not provided.
T getAdaptiveValue<T>({
  required BuildContext context,
  required T mobile,
  T? tablet,
  T? desktop,
}) {
  final screenType = getScreenType(context);
  switch (screenType) {
    case ScreenType.mobile:
      return mobile;
    case ScreenType.tablet:
      // If tablet is not provided, fall back to the mobile value.
      return tablet ?? mobile;
    case ScreenType.desktop:
      return desktop ?? tablet ?? mobile;
  }
}

// --- Reusable Adaptive Layout Widget ---
// This widget takes three builder functions and renders the appropriate one
// based on the available width from LayoutBuilder.
class AdaptiveLayout extends StatelessWidget {
  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  const AdaptiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileBreakpoint) {
          return mobile(context);
        } else if (constraints.maxWidth < tabletBreakpoint) {
          // If the tablet builder is not provided, fall back to mobile.
          return (tablet ?? mobile)(context);
        } else {
          return (desktop ?? tablet ?? mobile)(context);
        }
      },
    );
  }
}