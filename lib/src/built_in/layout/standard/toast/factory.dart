import 'package:flutter/widgets.dart';
import 'package:toastification/toastification.dart';

class StandardToastWidgetFactory {
  static Widget createStandardToastWidget({
    Key? key,
    required StandardStyle style,
    Widget? title,
    Widget? description,
    Widget? icon,
    Widget? chip,
    required VoidCallback onCloseTap,
    bool showCloseButton = true,
    ToastCloseButton closeButton = const ToastCloseButton(),
    Widget? progressBarWidget,
  }) {
    return switch (style) {
      StandardStyle.flat ||
      StandardStyle.flatColored ||
      StandardStyle.fillColored =>
        DefaultStandardToastWidget(
          title: title,
          description: description,
          icon: icon,
          showCloseButton: showCloseButton,
          onCloseTap: onCloseTap,
          closeButton: closeButton,
          progressBarWidget: progressBarWidget,
        ),
      StandardStyle.minimal => MinimalStandardToastWidget(
          title: title,
          description: description,
          icon: icon,
          showCloseButton: showCloseButton,
          onCloseTap: onCloseTap,
          closeButton: closeButton,
          progressBarWidget: progressBarWidget,
        ),
      StandardStyle.simple => SimpleStandardToastWidget(
          title: title,
          showCloseButton: showCloseButton,
          onCloseTap: onCloseTap,
          closeButton: closeButton,
        ),
      StandardStyle.chat => ChatStandardToastWidget(
          title: title,
          description: description,
          icon: icon,
          showCloseButton: showCloseButton,
          onCloseTap: onCloseTap,
          closeButton: closeButton,
          progressBarWidget: progressBarWidget,
        ),
      StandardStyle.card => CardStandardToastWidget(
          title: title,
          description: description,
          icon: icon,
          chip: chip,
          showCloseButton: showCloseButton,
          onCloseTap: onCloseTap,
          closeButton: closeButton,
          progressBarWidget: progressBarWidget,
        ),
      StandardStyle.glass => GlassStandardToastWidget(
          title: title,
          description: description,
          icon: icon,
          showCloseButton: showCloseButton,
          onCloseTap: onCloseTap,
          closeButton: closeButton,
          progressBarWidget: progressBarWidget,
        ),
      StandardStyle.gradient => GradientStandardToastWidget(
          title: title,
          description: description,
          icon: icon,
          showCloseButton: showCloseButton,
          onCloseTap: onCloseTap,
          closeButton: closeButton,
          progressBarWidget: progressBarWidget,
        ),
    };
  }
}
