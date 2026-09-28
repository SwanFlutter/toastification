import 'package:flutter/material.dart';
import 'package:toastification/src/built_in/layout/standard/style/style.dart';
import 'package:toastification/src/utils/color_utils.dart';

/// A frosted-glass toast: translucent surface, hairline light border, and a
/// backdrop blur behind the content.
class GlassStandardToastStyle extends BaseStandardToastStyle {
  const GlassStandardToastStyle({
    required super.type,
    super.providedValues,
    super.flutterTheme,
  });

  bool get isDark => flutterTheme?.brightness == Brightness.dark;

  @override
  DefaultStyleValues get defaults => DefaultStyleValues(
        primaryColor: type.color.toMaterialColor,
        surfaceLight: isDark ? const Color(0xFF2B3244) : Colors.white,
        surfaceDark: isDark ? Colors.white : const Color(0xDE000000),
        padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 12, 14),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(
          color: isDark ? const Color(0x2AFFFFFF) : const Color(0x99FFFFFF),
          width: 1,
        ),
      );

  @override
  Color get backgroundColor => providedValues?.surfaceLight ??
      defaults.surfaceLight.withValues(alpha: .55);

  @override
  Color get foregroundColor =>
      providedValues?.surfaceDark ?? defaults.surfaceDark;

  @override
  Color get iconColor => providedValues?.primaryColor ?? defaults.primaryColor;

  Color get badgeColor => iconColor.withValues(alpha: .14);

  @override
  List<BoxShadow> get boxShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: isDark ? .28 : .10),
          blurRadius: 18,
          offset: const Offset(0, 6),
        ),
      ];
}
