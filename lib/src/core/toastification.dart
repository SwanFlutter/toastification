import 'package:toastification/src/toastification_class.dart';

/// This is the main singleton class instance of the package.
/// You can use this instance to show and manage your notifications.
///
/// @deprecated This global instance is maintained for backward compatibility.
/// It is recommended to use the static methods on the Toastification class instead.
/// For example, use `Toastification.show()` instead of `toastification.show()`.
final toastification = Toastification();
