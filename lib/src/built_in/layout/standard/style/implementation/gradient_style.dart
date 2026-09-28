import 'package:flutter/material.dart';
import 'package:toastification/src/built_in/layout/standard/style/style.dart';
import 'package:toastification/src/utils/color_utils.dart';

/// A vivid toast painted with a type-colored diagonal gradient and a glow
/// shadow. Text and icon stay white for maximum contrast.
class GradientStandardToastStyle extends BaseStandardToastStyle {
  const GradientStandardToastStyle({
    required super.type,
    super.providedValues,
    super.flutterTheme,
  });

  bool get isDark => flutterTheme?.brightness == Brightness.dark;

  @override
  DefaultStyleValues get defaults => DefaultStyleValues(
        primaryColor: type.color.toMaterialColor,
        surfaceLight: Colors.white,
        surfaceDark: Colors.white,
        padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 12, 14),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide.none,
      );

  @override
  Color get backgroundColor => primaryColor.shade500;

  @override
  Color get foregroundColor =>
      providedValues?.surfaceDark ?? defaults.surfaceDark;

  @override
  Color get iconColor =>
      providedValues?.surfaceLight ?? defaults.surfaceLight;

  LinearGradient get gradient {
    final dark = isDark;
    return LinearGradient(
      colors: [
        primaryColor.shade400,
        dark ? primaryColor.shade800 : primaryColor.shade700,
      ],
      begin: AlignmentDirectional.topStart,
      end: AlignmentDirectional.bottomEnd,
    );
  }

  Color get badgeColor => Colors.white.withValues(alpha: .20);

  @override
  Color get closeIconColor => Colors.white.withValues(alpha: .7);

  @override
  List<BoxShadow> get boxShadow => [
        BoxShadow(
          color: primaryColor.withValues(alpha: isDark ? .32 : .28),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];

  @override
  ProgressIndicatorThemeData get defaultProgressIndicatorTheme =>
      ProgressIndicatorThemeData(
        color: Colors.white.withValues(alpha: .35),
        linearMinHeight: progressIndicatorStrokeWidth,
        linearTrackColor: Colors.white.withValues(alpha: .15),
        refreshBackgroundColor: Colors.white.withValues(alpha: .15),
      );
}
