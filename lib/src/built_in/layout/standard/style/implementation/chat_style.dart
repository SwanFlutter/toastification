import 'package:flutter/material.dart';
import 'package:toastification/src/built_in/layout/standard/style/style.dart';
import 'package:toastification/src/utils/color_utils.dart';

/// Color and shape defaults for the conversational toast layout.
class ChatStandardToastStyle extends BaseStandardToastStyle {
  const ChatStandardToastStyle({
    required super.type,
    super.providedValues,
    super.flutterTheme,
  });

  @override
  DefaultStyleValues get defaults => DefaultStyleValues(
        primaryColor: type.color.toMaterialColor,
        surfaceLight: flutterTheme?.brightness == Brightness.dark
            ? const Color(0xFF202532)
            : const Color(0xFFF8FAFF),
        surfaceDark: flutterTheme?.brightness == Brightness.dark
            ? const Color(0xFFF3F5FA)
            : const Color(0xFF202638),
        borderSide: BorderSide(
          color: type.color.withValues(alpha: .18),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 14, 14),
      );

  @override
  Color get iconColor => providedValues?.primaryColor ?? defaults.primaryColor;

  @override
  List<BoxShadow> get boxShadow => [
        BoxShadow(
          color: iconColor.withValues(alpha: .12),
          blurRadius: 22,
          offset: const Offset(0, 8),
        ),
      ];
}
