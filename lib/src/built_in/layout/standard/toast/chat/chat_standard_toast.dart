import 'package:flutter/material.dart';
import 'package:toastification/src/built_in/widget/common/close_button.dart';
import 'package:toastification/src/built_in/widget/common/toast_content.dart';
import 'package:toastification/src/utils/toast_theme_utils.dart';

/// A compact, conversational toast with a softly tinted icon badge.
class ChatStandardToastWidget extends StatelessWidget {
  const ChatStandardToastWidget({
    super.key,
    this.title,
    this.description,
    this.icon,
    required this.onCloseTap,
    this.showCloseButton = true,
    this.closeButton = const ToastCloseButton(),
    this.progressBarWidget,
  });

  final Widget? title;
  final Widget? description;
  final Widget? icon;
  final VoidCallback onCloseTap;
  final bool showCloseButton;
  final ToastCloseButton closeButton;
  final Widget? progressBarWidget;

  @override
  Widget build(BuildContext context) {
    final theme = context.toastTheme;
    final style = theme.toastStyle!;
    return Directionality(
      textDirection: theme.direction,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(minHeight: 68),
          decoration: BoxDecoration(
            color: style.blurredBackgroundColor(
              theme.applyBlurEffect,
              style.backgroundColor,
            ),
            borderRadius: style.borderRadius,
            border: Border.fromBorderSide(style.borderSide),
            boxShadow: style.boxShadow,
          ),
          padding: style.padding,
          child: Row(
            children: [
              if (theme.showIcon) ...[
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: style.iconColor.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: IconTheme(
                    data: IconThemeData(color: style.iconColor, size: 21),
                    child: icon ?? Icon(style.icon),
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: ToastContent(
                  title: title,
                  description: description,
                  progressBarWidget: progressBarWidget,
                ),
              ),
              if (showCloseButton) ...[
                const SizedBox(width: 6),
                ToastCloseButtonHolder(
                  onCloseTap: onCloseTap,
                  showCloseButton: true,
                  toastCloseButton: closeButton,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
