import 'package:flutter/material.dart';

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}

extension BuildContextExtenison on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;
}
