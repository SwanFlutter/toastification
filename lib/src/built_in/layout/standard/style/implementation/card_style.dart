import 'package:flutter/material.dart';
import 'package:toastification/src/built_in/layout/standard/style/style.dart';
import 'package:toastification/src/utils/color_utils.dart';

/// An elegant card layout with a bold accent bar on the leading edge,
/// a tinted icon badge, and soft shadows.
///
/// Mirrors the design language of timeline/event cards: in RTL layouts the
/// accent bar sits on the right, in LTR it sits on the left.
class CardStandardToastStyle extends BaseStandardToastStyle {
  const CardStandardToastStyle({
    required super.type,
    super.providedValues,
    super.flutterTheme,
  });

  bool get isDark => flutterTheme?.brightness == Brightness.dark;

  @override
  DefaultStyleValues get defaults => DefaultStyleValues(
        primaryColor: type.color.toMaterialColor,
        surfaceLight: Colors.white,
        surfaceDark: const Color(0xDE000000),
        padding: const EdgeInsets.all(14),
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        borderSide: BorderSide(
          color: isDark ? const Color(0x1FFFFFFF) : const Color(0x14000000),
          width: 1,
        ),
      );

  @override
  Color get backgroundColor => providedValues?.surfaceLight ??
      (isDark ? const Color(0xFF1E2533) : defaults.surfaceLight);

  @override
  Color get foregroundColor => providedValues?.surfaceDark ??
      (isDark ? Colors.white : defaults.surfaceDark);

  /// The color of the leading accent bar.
  Color get accentColor => providedValues?.primaryColor ?? defaults.primaryColor;

  /// Background of the rounded square behind the icon.
  Color get iconBadgeColor => accentColor.withValues(alpha: .12);

  @override
  Color get iconColor => accentColor;

  @override
  List<BoxShadow> get boxShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: isDark ? .18 : .06),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ];
}
