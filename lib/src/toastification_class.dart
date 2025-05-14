import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:toastification/src/built_in/built_in_builder.dart';
import 'package:toastification/src/core/toastification_manager.dart';
import 'package:toastification/src/core/toastification_overlay_state.dart';
import 'package:toastification/toastification.dart';

/// This is the main class of the package.
/// You can use this class to show and manage your notifications.
///
/// use [show] method to show a built-in notifications
/// example :
///
/// ```dart
/// Toastification.show(
///   title: Text('Hello World'),
///   description: Text('This is a notification'),
///   type: ToastificationType.info,
///   style: ToastificationStyle.flat,
///   autoCloseDuration: Duration(seconds: 3),
/// );
/// ```
///
/// use [showCustom] method to show a custom notification
/// you should create your own widget and pass it to the [builder] parameter
/// example :
///
/// ```dart
/// Toastification.showCustom(
///   alignment: Alignment.topRight,
///   animationDuration: Duration(milliseconds: 500),
///   autoCloseDuration: Duration(seconds: 3),
///   builder: (context, item) {
///     return CustomToastWidget();
///   },
/// );
/// ```
class Toastification {
  static final Toastification _instance = Toastification._internal();

  /// Private constructor for the singleton class
  Toastification._internal();

  /// returns the singleton instance of the class
  factory Toastification() => _instance;

  /// list of managers for each [Alignment] object
  ///
  /// for each [Alignment] object we will create a [ToastificationManager]
  @visibleForTesting
  final Map<Alignment, ToastificationManager> managers = {};

  /// Shows a custom notification statically without needing to create an instance
  ///
  /// you should create your own widget and pass it to the [builder] parameter
  /// in the [builder] parameter you have the access to [ToastificationItem]
  /// so you may want to use that to create your widget.
  ///
  /// the return value is a [ToastificationItem] that you can use to dismiss the notification
  /// or find the notification details by its [id]
  ///
  /// example :
  ///
  /// ```dart
  /// Toastification.showCustom(
  ///   alignment: Alignment.topRight,
  ///   animationDuration: Duration(milliseconds: 500),
  ///   autoCloseDuration: Duration(seconds: 3),
  ///   builder: (context, item) {
  ///     return CustomToastWidget();
  ///   },
  /// );
  /// ```
  static ToastificationItem showCustom({
    /// - [context]: The build context in which the toast is to be shown.
    BuildContext? context,

    /// - [alignment]: The alignment of the toast on the screen.
    AlignmentGeometry? alignment,

    /// - [direction]: The text direction of the toast.
    TextDirection? direction,

    /// - [builder]: A builder function that returns the widget to be shown as the toast.
    required ToastificationBuilder builder,

    /// - [animationBuilder]: A builder function for custom animations.
    ToastificationAnimationBuilder? animationBuilder,

    /// - [animationDuration]: The duration of the animation.
    Duration? animationDuration,

    /// - [autoCloseDuration]: The duration after which the toast will auto-close.
    Duration? autoCloseDuration,

    /// - [overlayState]: The overlay state to use for showing the toast.
    OverlayState? overlayState,

    /// - [dismissDirection]: The direction in which the toast can be dismissed.
    DismissDirection? dismissDirection,

    /// - [callbacks]: Callbacks for various events like onShow, onDismiss, etc.
    ToastificationCallbacks callbacks = const ToastificationCallbacks(),
  }) {
    return Toastification().showCustomInstance(
      context: context,
      alignment: alignment,
      direction: direction,
      builder: builder,
      animationBuilder: animationBuilder,
      animationDuration: animationDuration,
      autoCloseDuration: autoCloseDuration,
      overlayState: overlayState,
      dismissDirection: dismissDirection,
      callbacks: callbacks,
    );
  }

  /// Shows a predefined toast widget statically without needing to create an instance
  ///
  /// you can use this method to show a built-in toasts
  ///
  /// the return value is a [ToastificationItem] that you can use to dismiss the notification
  /// or find the notification details by its [id]
  ///
  /// example :
  ///
  /// ```dart
  /// Toastification.show(
  ///   title: Text('Hello World'),
  ///   description: Text('This is a notification'),
  ///   type: ToastificationType.info,
  ///   style: ToastificationStyle.flat,
  ///   autoCloseDuration: Duration(seconds: 3),
  /// );
  /// ```
  static ToastificationItem show({
    /// - [context]: The build context in which the toast is to be shown.
    BuildContext? context,

    /// - [overlayState]: The overlay state to use for showing the toast.
    OverlayState? overlayState,

    /// - [alignment]: The alignment of the toast on the screen.
    AlignmentGeometry? alignment,

    /// - [autoCloseDuration]: The duration after which the toast will auto-close.
    Duration? autoCloseDuration,

    /// - [animationDuration]: The duration of the animation.
    Duration? animationDuration,

    /// - [animationBuilder]: A builder function for custom animations.
    ToastificationAnimationBuilder? animationBuilder,

    /// - [type]: The type of the toast (e.g., info, success, error).
    ToastificationType? type,

    /// - [style]: The style of the toast (e.g., flat, filled).
    ToastificationStyle? style,

    /// - [title]: The title widget of the toast.
    Widget? title,

    /// - [description]: The description widget of the toast.
    Widget? description,

    /// - [icon]: The icon widget of the toast.
    Widget? icon,

    /// - [primaryColor]: The primary color of the toast.
    Color? primaryColor,

    /// - [backgroundColor]: The background color of the toast.
    Color? backgroundColor,

    /// - [foregroundColor]: The foreground color of the toast.
    Color? foregroundColor,

    /// - [padding]: The padding of the toast.
    EdgeInsetsGeometry? padding,

    /// - [margin]: The margin of the toast.
    EdgeInsetsGeometry? margin,

    /// - [borderRadius]: The border radius of the toast.
    BorderRadiusGeometry? borderRadius,

    /// - [borderSide]: The border side of the toast.
    BorderSide? borderSide,

    /// - [boxShadow]: The box shadow of the toast.
    List<BoxShadow>? boxShadow,

    /// - [direction]: The text direction of the toast.
    TextDirection? direction,

    /// - [showProgressBar]: Whether to show a progress bar.
    bool? showProgressBar,

    /// - [progressBarTheme]: The theme of the progress bar.
    ProgressIndicatorThemeData? progressBarTheme,

    /// - [closeButton]: The close button widget of the toast.
    ToastCloseButton closeButton = const ToastCloseButton(),

    /// - [closeOnClick]: Whether to close the toast on click.
    bool? closeOnClick,

    /// - [dragToClose]: Whether to allow dragging to close the toast.
    bool? dragToClose,

    /// - [showIcon]: Whether to show the icon.
    bool? showIcon,

    /// - [dismissDirection]: The direction in which the toast can be dismissed.
    DismissDirection? dismissDirection,

    /// - [pauseOnHover]: Whether to pause the auto-close timer on hover.
    bool? pauseOnHover,

    /// - [applyBlurEffect]: Whether to apply a blur effect.
    bool? applyBlurEffect,

    /// - [callbacks]: Callbacks for various events like onShow, onDismiss, etc.
    ToastificationCallbacks callbacks = const ToastificationCallbacks(),
  }) {
    return Toastification().showInstance(
      context: context,
      overlayState: overlayState,
      alignment: alignment,
      autoCloseDuration: autoCloseDuration,
      animationDuration: animationDuration,
      animationBuilder: animationBuilder,
      type: type,
      style: style,
      title: title,
      description: description,
      icon: icon,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      borderSide: borderSide,
      boxShadow: boxShadow,
      direction: direction,
      showProgressBar: showProgressBar,
      progressBarTheme: progressBarTheme,
      closeButton: closeButton,
      closeOnClick: closeOnClick,
      dragToClose: dragToClose,
      showIcon: showIcon,
      dismissDirection: dismissDirection,
      pauseOnHover: pauseOnHover,
      applyBlurEffect: applyBlurEffect,
      callbacks: callbacks,
    );
  }

  /// shows a custom notification
  ///
  /// you should create your own widget and pass it to the [builder] parameter
  /// in the [builder] parameter you have the access to [ToastificationItem]
  /// so you may want to use that to create your widget.
  ///
  /// the return value is a [ToastificationItem] that you can use to dismiss the notification
  /// or find the notification details by its [id]
  ///
  /// example :
  ///
  /// ```dart
  /// Toastification().showCustomInstance(
  ///   context: context, // optional if ToastificationWrapper is in widget tree
  ///   alignment: Alignment.topRight,
  ///   animationDuration: Duration(milliseconds: 500),
  ///   autoCloseDuration: Duration(seconds: 3),
  ///   builder: (context, item) {
  ///     return CustomToastWidget();
  ///   },
  /// );
  /// ```
  ToastificationItem showCustomInstance({
    /// - [context]: The build context in which the toast is to be shown.
    BuildContext? context,

    /// - [alignment]: The alignment of the toast on the screen.
    AlignmentGeometry? alignment,

    /// - [direction]: The text direction of the toast.
    TextDirection? direction,

    /// - [builder]: A builder function that returns the widget to be shown as the toast.
    required ToastificationBuilder builder,

    /// - [animationBuilder]: A builder function for custom animations.
    ToastificationAnimationBuilder? animationBuilder,

    /// - [animationDuration]: The duration of the animation.
    Duration? animationDuration,

    /// - [autoCloseDuration]: The duration after which the toast will auto-close.
    Duration? autoCloseDuration,

    /// - [overlayState]: The overlay state to use for showing the toast.
    OverlayState? overlayState,

    /// - [dismissDirection]: The direction in which the toast can be dismissed.
    DismissDirection? dismissDirection,

    /// - [callbacks]: Callbacks for various events like onShow, onDismiss, etc.
    ToastificationCallbacks callbacks = const ToastificationCallbacks(),
  }) {
    context ??= overlayState?.context;

    final contextProvided = context?.mounted == true;

    if (contextProvided) {
      direction ??= Directionality.of(context!);
      overlayState ??= Overlay.maybeOf(context!, rootOverlay: true);
    }

    /// if context isn't provided
    /// or the overlay can't be found in the provided context
    ToastificationOverlayState? toastificationOverlayState;
    if (overlayState == null) {
      toastificationOverlayState = findToastificationOverlayState();
      overlayState = toastificationOverlayState.overlayState;
    }

    /// find the config from the context or use the global config
    final ToastificationConfig config =
        (contextProvided
            ? ToastificationConfigProvider.maybeOf(context!)?.config
            : toastificationOverlayState?.globalConfig) ??
        const ToastificationConfig();

    direction ??= TextDirection.ltr;

    final effectiveAlignment = (alignment ?? config.alignment).resolve(
      direction,
    );

    final manager = managers.putIfAbsent(
      effectiveAlignment,
      () =>
          ToastificationManager(alignment: effectiveAlignment, config: config),
    );

    return manager.showCustom(
      builder: builder,
      scheduler: SchedulerBinding.instance,
      animationBuilder: animationBuilder,
      animationDuration: animationDuration,
      autoCloseDuration: autoCloseDuration,
      overlayState: overlayState!,
      callbacks: callbacks,
    );
  }

  /// shows a predefined toast widget base on the parameters
  ///
  /// you can use this method to show a built-in toasts
  ///
  /// the return value is a [ToastificationItem] that you can use to dismiss the notification
  /// or find the notification details by its [id]
  ///
  /// example :
  ///
  /// ```dart
  /// Toastification().showInstance(
  ///   context: context, // optional if ToastificationWrapper is in widget tree
  ///   alignment: Alignment.topRight,
  ///   title: Text('Hello World'),
  ///   description: Text('This is a notification'),
  ///   type: ToastificationType.info,
  ///   style: ToastificationStyle.flat,
  ///   autoCloseDuration: Duration(seconds: 3),
  /// );
  /// ```
  ToastificationItem showInstance({
    /// - [context]: The build context in which the toast is to be shown.
    BuildContext? context,

    /// - [overlayState]: The overlay state to use for showing the toast.
    OverlayState? overlayState,

    /// - [alignment]: The alignment of the toast on the screen.
    AlignmentGeometry? alignment,

    /// - [autoCloseDuration]: The duration after which the toast will auto-close.
    Duration? autoCloseDuration,

    /// - [animationDuration]: The duration of the animation.
    Duration? animationDuration,

    /// - [animationBuilder]: A builder function for custom animations.
    ToastificationAnimationBuilder? animationBuilder,

    /// - [type]: The type of the toast (e.g., info, success, error).
    ToastificationType? type,

    /// - [style]: The style of the toast (e.g., flat, filled).
    ToastificationStyle? style,

    /// - [title]: The title widget of the toast.
    Widget? title,

    /// - [description]: The description widget of the toast.
    Widget? description,

    /// - [icon]: The icon widget of the toast.
    Widget? icon,

    /// - [primaryColor]: The primary color of the toast.
    Color? primaryColor,

    /// - [backgroundColor]: The background color of the toast.
    Color? backgroundColor,

    /// - [foregroundColor]: The foreground color of the toast.
    Color? foregroundColor,

    /// - [padding]: The padding of the toast.
    EdgeInsetsGeometry? padding,

    /// - [margin]: The margin of the toast.
    EdgeInsetsGeometry? margin,

    /// - [borderRadius]: The border radius of the toast.
    BorderRadiusGeometry? borderRadius,

    /// - [borderSide]: The border side of the toast.
    BorderSide? borderSide,

    /// - [boxShadow]: The box shadow of the toast.
    List<BoxShadow>? boxShadow,

    /// - [direction]: The text direction of the toast.
    TextDirection? direction,

    /// - [showProgressBar]: Whether to show a progress bar.
    bool? showProgressBar,

    /// - [progressBarTheme]: The theme of the progress bar.
    ProgressIndicatorThemeData? progressBarTheme,

    /// - [closeButton]: The close button widget of the toast.
    ToastCloseButton closeButton = const ToastCloseButton(),

    /// - [closeOnClick]: Whether to close the toast on click.
    bool? closeOnClick,

    /// - [dragToClose]: Whether to allow dragging to close the toast.
    bool? dragToClose,

    /// - [showIcon]: Whether to show the icon.
    bool? showIcon,

    /// - [dismissDirection]: The direction in which the toast can be dismissed.
    DismissDirection? dismissDirection,

    /// - [pauseOnHover]: Whether to pause the auto-close timer on hover.
    bool? pauseOnHover,

    /// - [applyBlurEffect]: Whether to apply a blur effect.
    bool? applyBlurEffect,

    /// - [callbacks]: Callbacks for various events like onShow, onDismiss, etc.
    ToastificationCallbacks callbacks = const ToastificationCallbacks(),
  }) {
    // Handle deprecated closeButtonShowType
    var toastCloseButton = closeButton;

    return showCustomInstance(
      context: context,
      overlayState: overlayState,
      alignment: alignment,
      direction: direction,
      autoCloseDuration: autoCloseDuration,
      animationBuilder: animationBuilder,
      animationDuration: animationDuration,
      callbacks: callbacks,
      builder: (context, holder) {
        return BuiltInBuilder(
          item: holder,
          type: type,
          style: style,
          title: title,
          description: description,
          icon: icon,
          primaryColor: primaryColor,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          margin: margin,
          borderRadius: borderRadius,
          borderSide: borderSide,
          boxShadow: boxShadow,
          direction: direction,
          showIcon: showIcon,
          showProgressBar: showProgressBar,
          progressBarTheme: progressBarTheme,
          closeButton: toastCloseButton,
          closeOnClick: closeOnClick,
          dragToClose: dragToClose,
          dismissDirection: dismissDirection,
          pauseOnHover: pauseOnHover,
          applyBlurEffect: applyBlurEffect,
          callbacks: callbacks,
        );
      },
    );
  }

  /// finds and returns a [ToastificationItem] by its [id]
  ///
  /// if there is no notification with the given [id] it will return null
  ///
  /// Parameters:
  /// - [id]: The id of the toast to find.
  ToastificationItem? findToastificationItem(String id) {
    try {
      for (final manager in managers.values) {
        final foundValue = manager.findToastificationItem(id);

        if (foundValue != null) {
          return foundValue;
        }
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  /// dismisses the given [notification]
  ///
  /// if the [notification] is not in the list, nothing will happen
  ///
  /// Parameters:
  /// - [notification]: The toast to dismiss.
  /// - [showRemoveAnimation]: Whether to show the remove animation.
  void dismiss(
    ToastificationItem notification, {
    bool showRemoveAnimation = true,
  }) {
    final manager = managers[notification.alignment];

    if (manager != null) {
      manager.dismiss(notification, showRemoveAnimation: showRemoveAnimation);
    }
  }

  /// dismisses all notifications that are currently showing in the screen
  ///
  /// The [delayForAnimation] parameter is used to determine
  /// whether to wait for the animation to finish or not.
  ///
  /// Parameters:
  /// - [delayForAnimation]: Whether to wait for the animation to finish.
  void dismissAll({bool delayForAnimation = true}) {
    for (final manager in managers.values) {
      manager.dismissAll(delayForAnimation: delayForAnimation);
    }
  }

  /// dismisses a notification by its [id]
  ///
  /// if there is no notification with the given [id] nothing will happen
  ///
  /// Parameters:
  /// - [id]: The id of the toast to dismiss.
  /// - [showRemoveAnimation]: Whether to show the remove animation.
  void dismissById(String id, {bool showRemoveAnimation = true}) {
    final notification = findToastificationItem(id);

    if (notification != null) {
      dismiss(notification, showRemoveAnimation: true);
    }
  }
}
