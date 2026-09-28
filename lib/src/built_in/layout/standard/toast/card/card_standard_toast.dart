import 'package:flutter/material.dart';
import 'package:toastification/src/built_in/layout/standard/style/implementation/card_style.dart';
import 'package:toastification/src/built_in/widget/common/close_button.dart';
import 'package:toastification/src/built_in/widget/common/toast_content.dart';
import 'package:toastification/src/utils/toast_theme_utils.dart';

/// An elegant card toast with a leading accent bar, an optional chip next to
/// the title, and a tinted icon badge.
class CardStandardToastWidget extends StatelessWidget {
  const CardStandardToastWidget({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.chip,
    required this.onCloseTap,
    this.showCloseButton = true,
    this.closeButton = const ToastCloseButton(),
    this.progressBarWidget,
  });

  final Widget? title;
  final Widget? description;
  final Widget? icon;

  /// A small badge rendered after the title, e.g. a date or tag.
  final Widget? chip;

  final VoidCallback onCloseTap;
  final bool showCloseButton;
  final ToastCloseButton closeButton;
  final Widget? progressBarWidget;

  @override
  Widget build(BuildContext context) {
    final theme = context.toastTheme;
    final style = theme.toastStyle! as CardStandardToastStyle;

    final titled = title == null
        ? null
        : chip == null
            ? title
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: title!),
                  const SizedBox(width: 8),
                  chip!,
                ],
              );

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
            boxShadow: style.boxShadow,
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 5,
                  decoration: BoxDecoration(
                    color: style.accentColor,
                    borderRadius: BorderRadiusDirectional.horizontal(
                      start: Radius.circular(
                        style.borderRadius.resolve(theme.direction).topLeft.x *
                            .8,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: style.padding,
                    child: Row(
                      children: [
                        Expanded(
                          child: ToastContent(
                            title: titled,
                            description: description,
                            progressBarWidget: progressBarWidget,
                          ),
                        ),
                        if (theme.showIcon) ...[
                          const SizedBox(width: 12),
                          Container(
                            width: 38,
                            height: 38,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: style.iconBadgeColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconTheme(
                              data: IconThemeData(
                                color: style.iconColor,
                                size: 20,
                              ),
                              child: icon ?? Icon(style.icon),
                            ),
                          ),
                        ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
