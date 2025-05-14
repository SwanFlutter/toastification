# Toastification

[![pub package](https://img.shields.io/pub/v/toastification?color=blue&style=plastic)](https://pub.dartlang.org/packages/toastification) [![codecov](https://codecov.io/gh/payam-zahedi/toastification/graph/badge.svg?token=UTQX773WXM)](https://codecov.io/gh/payam-zahedi/toastification)

<p align="left">
  <img width="576" alt="intro" src="https://github.com/user-attachments/assets/86dc1f6f-8675-467b-b1d6-78be0e505641" width="100%" alt="Styles" />

</p>

Toastification is a Flutter package that allows developers to easily display toast notifications in their apps. Toast notifications are a type of pop-up message that typically appear on the screen and disappear after a short amount of time. They are commonly used to display information, alerts, or confirmations to the user.

One of the advantages of the Toastification package is its ability to handle multiple toast messages. With Toastification, developers can display multiple toast notifications at once and display them in a queue. This means that if multiple notifications are triggered at the same time, they will be displayed one after the other, rather than overlapping on the screen.

Overall, Toastification is a useful package for Flutter developers who want to add toast notifications to their apps without having to write the code from scratch.

## [Toast Builder](https://payamzahedi.com/toastification/)

Don't want to dive into the whole documentation? No problem!
Just head over to our [Toast Builder Website](https://payamzahedi.com/toastification/), where you can effortlessly customize your toast notifications, copy the generated code, and seamlessly integrate them into your project. It's the quickest way to get started with Toastification!

https://github.com/payam-zahedi/toastification/assets/47558577/0e40aefd-b768-4d13-b982-eeeefb2256e9

## Installation

To use Toastification, you need to add it to your pubspec.yaml file:

```yaml
dependencies:
  toastification: latest_version
```

Then, run `flutter pub get` to install the package.

## Usage

To use Toastification in your Flutter app, first import the package:

```dart
import 'package:toastification/toastification.dart';
```

### Quick Start

The easiest way to use Toastification is with the static methods:

```dart
// Show a success toast
Toastification.show(
  title: Text('Success!'),
  description: Text('Operation completed successfully'),
  type: ToastificationType.success,
  style: ToastificationStyle.fillColored,
  autoCloseDuration: Duration(seconds: 3),
);

// Show a custom toast
Toastification.showCustom(
  alignment: Alignment.topRight,
  builder: (context, item) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('Custom Toast', style: TextStyle(color: Colors.white)),
    );
  },
);
```

### Different Ways to Use Toastification

You can use Toastification in three different ways:

1. Using the static methods (recommended):
   - `Toastification.show()`: to show predefined toast messages with predefined styles.
   - `Toastification.showCustom()`: to show custom toast messages with custom styles.

2. Using the class instance methods:
   - `Toastification().showInstance()`: to show predefined toast messages with predefined styles.
   - `Toastification().showCustomInstance()`: to show custom toast messages with custom styles.

3. Using the global instance (legacy approach):
   - `toastification.show()`: to show predefined toast messages with predefined styles.
   - `toastification.showCustom()`: to show custom toast messages with custom styles.

## Usage without context

When using the static methods (`Toastification.show()` and `Toastification.showCustom()`), you don't need to provide a context in most cases.

However, for complete context-free usage throughout your app, wrap your AppWidget with `ToastificationWrapper`:

```dart
return ToastificationWrapper(
  child: MaterialApp(),
);
```

With this setup, you can use any of the Toastification methods without providing `context`.

## Show Method

By using the `show` method, you can show predefined toast messages. You can use the `ToastificationType` enum to choose the type and `ToastificationStyle` enum to choose the style of the toast message.

<p align="center">
<img src="https://github.com/user-attachments/assets/72854e59-0ce1-45b5-852c-a9a42836f248" width="100%" alt="Types" />
</p>

### Using Static Method (Recommended)

```dart
// No need to create an instance or use context
Toastification.show(
  title: Text('Hello, world!'),
  autoCloseDuration: const Duration(seconds: 5),
);
```

### Using Instance Method

```dart
Toastification().showInstance(
  context: context, // optional if you use ToastificationWrapper
  title: Text('Hello, world!'),
  autoCloseDuration: const Duration(seconds: 5),
);
```

### Using Legacy Approach

```dart
Toastification.show(
  context: context, // optional if you use ToastificationWrapper
  title: Text('Hello, world!'),
  autoCloseDuration: const Duration(seconds: 5),
);
```

This will display a toast message with the text "Hello, world!".

You can customize the appearance of the toast message by passing in additional parameters to the `show()` method:

```dart
Toastification.show(
  context: context, // optional if you use ToastificationWrapper
  type: ToastificationType.success,
  style: ToastificationStyle.flat,
  autoCloseDuration: const Duration(seconds: 5),
  title: Text('Hello, World!'),
  // you can also use RichText widget for title and description parameters
  description: RichText(text: const TextSpan(text: 'This is a sample toast message. ')),
  alignment: Alignment.topRight,
  direction: TextDirection.ltr,
  animationDuration: const Duration(milliseconds: 300),
  animationBuilder: (context, animation, alignment, child) {
    return FadeTransition(
      turns: animation,
      child: child,
    );
  },
  icon: const Icon(Icons.check),
  showIcon: true, // show or hide the icon
  primaryColor: Colors.green,
  backgroundColor: Colors.white,
  foregroundColor: Colors.black,
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  borderRadius: BorderRadius.circular(12),
  boxShadow: const [
    BoxShadow(
      color: Color(0x07000000),
      blurRadius: 16,
      offset: Offset(0, 16),
      spreadRadius: 0,
    )
  ],
  showProgressBar: true,
  closeButton: ToastCloseButton(
    showType: CloseButtonShowType.onHover,
    buttonBuilder: (context, onClose) {
      return OutlinedButton.icon(
        onPressed: onClose,
        icon: const Icon(Icons.close, size: 20),
        label: const Text('Close'),
      );
    },
  ),
  closeOnClick: false,
  pauseOnHover: true,
  dragToClose: true,
  applyBlurEffect: true,
  callbacks: ToastificationCallbacks(
    onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
    onCloseButtonTap: (toastItem) => print('Toast ${toastItem.id} close button tapped'),
    onAutoCompleteCompleted: (toastItem) => print('Toast ${toastItem.id} auto complete completed'),
    onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
  ),
);
```

### ToastificationStyle

We have 5 predefined styles for toast messages, each offering a unique look and feel to match your application's design. Here's a breakdown of each style:

<p align="left">
<img src="https://github.com/user-attachments/assets/b1959058-aac0-4626-a972-ded1cdc5ffe9" width="100%" alt="Styles" />
</p>

1. **ToastificationStyle.flat**

   - A simple and clean style with a subtle border and no background fill. Ideal for minimalist notifications that don't overwhelm the interface.

2. **ToastificationStyle.fillColored**

   - A bold style with a solid colored background. Perfect for high-visibility alerts or important notifications that need immediate attention.

3. **ToastificationStyle.flatColored**

   - A balanced style with a flat design, colored borders, and text, but without a solid fill. Great for notifications that need to stand out without being too bold.

4. **ToastificationStyle.minimal**

   - A sleek and modern design with minimal elements and an accent line denoting the notification type. Perfect for clean, distraction-free interfaces.

5. **ToastificationStyle.simple**
   - A straightforward style showing a single line of text. Best for short, simple messages or confirmations where minimal design is preferred.

## ShowCustom Method

If you are looking for even more control over the appearance and behavior of your toast messages, you can use the showCustom() method to create a completely custom toast message. This method lets you pass in a builder function that returns the widget you want to display, giving you complete control over the toast's layout, styling, and interactivity.

With showCustom(), the possibilities are endless. You can create a custom toast message that matches your app's unique visual style, or you can add interactive elements like buttons and sliders to make your toast messages more engaging and dynamic.

### Using Static Method (Recommended)

```dart
Toastification.showCustom(
  autoCloseDuration: const Duration(seconds: 5),
  alignment: Alignment.topRight,
  builder: (BuildContext context, ToastificationItem holder) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Custom Toast',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('This is a custom toast message!',
              style: TextStyle(color: Colors.white)),
          const SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Perform an action when the button is pressed
                },
                child: const Text('Do Something'),
              ),
            ],
          ),
        ],
      ),
    );
  },
);
```

### Using Instance Method

```dart
Toastification().showCustomInstance(
  context: context, // optional if you use ToastificationWrapper
  autoCloseDuration: const Duration(seconds: 5),
  alignment: Alignment.topRight,
  builder: (BuildContext context, ToastificationItem holder) {
    // Your custom toast widget
    return Container(
      // ... your custom widget implementation
    );
  },
);
```

### Using Legacy Approach

```dart
Toastification.showCustom(
  context: context, // optional if you use ToastificationWrapper
  autoCloseDuration: const Duration(seconds: 5),
  alignment: Alignment.topRight,
  builder: (BuildContext context, ToastificationItem holder) {
    // Your custom toast widget
    return Container(
      // ... your custom widget implementation
    );
  },
);
```

With showCustom(), you're only limited by your imagination. Create a toast message that stands out from the crowd and adds a touch of personality to your app!

### Using GlobalNavigatorKey

If you need to show toasts from places where you don't have access to the BuildContext, you can use a GlobalNavigatorKey. This is particularly handy when you are using frameworks like GetX, where you don't have access to `context`.

First, create a GlobalNavigatorKey:
‍‍

```dart
final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();
```

Then, assign it to your MaterialApp:

```dart
MaterialApp(
  navigatorKey: navigatorKey,
  // ... other properties
)
```

Now you can `show` toasts using the overlayState from the navigatorKey:

```dart
Toastification.show(
  overlayState: navigatorKey.currentState?.overlay,
  autoCloseDuration: const Duration(seconds: 5),
  title: Text('Hello, World!'),
);
```

If you want to use `showCustom` instead, you can use it like this:

```dart
Toastification.showCustom(
  overlayState: navigatorKey.currentState?.overlay,
  autoCloseDuration: const Duration(seconds: 5),
  builder: (BuildContext context, ToastificationItem holder) {
     // Your custom toast widget
  },
);
```

## Custom Animations

You can customize the animation of the toast notification by providing a Duration for the animation duration and implementing your own animation builder function using the animationBuilder parameter. Here's an example of how to use custom animations:

```dart
Toastification.show(
  context: context,
  title: Text('Hello, world!'),
  // .... Other parameters
  animationDuration: const Duration(milliseconds: 300),
  animationBuilder: (context, animation, alignment, child) {
    return RotationTransition(
      turns: animation,
      child: child,
    );
  },
);
```

## Global/Default Configuration

Global configuration allows you to change the default behavior of Toastification across your entire application or in a specific page. To achieve this, you can provide your own `ToastificationConfig` using the `ToastificationConfigProvider` widget.

The `ToastificationConfigProvider` is an inherited widget, which means the provided configuration will be available to all child widgets in the widget tree. This allows you to maintain consistent toast notification behavior throughout your app.

#### Applying Global Configuration for the Whole App

To apply global configuration for the entire application, use `builder` parameter of the `MaterialApp` widget to wrap your pages with `ToastificationConfigProvider` and provide an instance of `ToastificationConfig`. Here's an example:

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toastification',
      builder: (context, child) {
        return ToastificationConfigProvider(
          config: const ToastificationConfig(
            margin: EdgeInsets.fromLTRB(0, 16, 0, 110),
            alignment: Alignment.center,
            itemWidth: 440,
            animationDuration: Duration(milliseconds: 500),
          ),
          child: child!,
        );
      },
    );
  }
}
```

#### Applying Global Configuration for a Specific Page

To apply global configuration for a specific page, you can wrap the widget tree of that page with `ToastificationConfigProvider` and provide an instance of `ToastificationConfig`. Here's an example:

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ToastificationConfigProvider(
      config: ToastificationConfig(
        margin: EdgeInsets.fromLTRB(0, 16, 0, 110),
        alignment: Alignment.center,
        itemWidth: 440,
        animationDuration: Duration(milliseconds: 500),
      ),
      child: Scaffold(
        body: HomeBody(),
      ),
    );
  }
}
```

## Manage Your Notifications

In addition to displaying toast messages, the Toastification package also provides methods for managing and dismissing existing notifications. Here are the available methods:

#### Find a Notification item

Find a notification with the given ID.

```dart
// Using static method (recommended)
final notification = Toastification().findToastificationItem('my_notification_id');

// Using legacy approach
final notification = toastification.findToastificationItem('my_notification_id');
```

#### Dismiss a Notification

Remove a specific notification from the screen.

```dart
// Using static method (recommended)
final notification = Toastification.show(
  title: Text('Hello'),
  autoCloseDuration: const Duration(seconds: 5),
);

Toastification().dismiss(notification);

// Using legacy approach
final notification = toastification.show(
  context: context,
  title: Text('Hello'),
  autoCloseDuration: const Duration(seconds: 5),
);

toastification.dismiss(notification);
```

#### Dismiss a Notification by ID

Remove a notification with the given ID from the screen.

```dart
// Using static method (recommended)
Toastification().dismissById('my_notification_id');

// Using legacy approach
toastification.dismissById('my_notification_id');
```

#### Dismiss All Notifications

Remove all notifications that are currently displayed on the screen.

```dart
// Using static method (recommended)
Toastification().dismissAll(delayForAnimation: true);

// Using legacy approach
toastification.dismissAll(delayForAnimation: true);
```

You can customize the dismissal behavior by setting the `delayForAnimation` parameter. If set to `true`, Toastification will wait for the animation to finish before dismissing all notifications. If set to `false`, the notifications will be dismissed immediately without waiting for the animation.

#### Dismiss First Notification

Remove the first notification from the screen.

```dart
toastification.dismissFirst();
```

#### Dismiss Last Notification

Remove the last notification from the screen.

```dart
toastification.dismissLast();
```

## Migration Guide

### Migrating from Legacy to Static Methods

If you're using the legacy approach with the global `toastification` instance, you can easily migrate to the recommended static methods:

**Before:**
```dart
toastification.show(
  context: context,
  title: Text('Hello World'),
  type: ToastificationType.success,
  autoCloseDuration: Duration(seconds: 3),
);
```

**After:**
```dart
Toastification.show(
  title: Text('Hello World'),
  type: ToastificationType.success,
  autoCloseDuration: Duration(seconds: 3),
);
```

The static methods don't require context in most cases, making your code cleaner and more concise.

## Project Structure

Toastification is organized with a clean, modular structure:

```
lib/
├── toastification.dart        # Main entry point
└── src/
    ├── toastification_class.dart  # Main class with static methods
    ├── core/                  # Core functionality
    ├── built_in/              # Built-in toast styles and types
    └── utils/                 # Utility functions
```

The main class `Toastification` provides both static methods and instance methods for flexibility.

## Design

Toastification was redesigned by [Sepide Moqadasi](https://sepide.design/). We want to extend our heartfelt appreciation to Sepide for her exceptional design work, which has made Toastification visually appealing and user-friendly. Special thanks to Sepide for her valuable contributions to this project.

<p align="left">
<img src="https://github.com/user-attachments/assets/f7680078-19f8-4e90-b83f-5c043bde9dd1" width="49%" alt="Styles" />
<img src="https://github.com/user-attachments/assets/c6a32135-f951-41b2-a348-f0336f9bb774" width="49%" alt="Styles" />
</p>

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

Contributions are always welcome! If you have any suggestions, bug reports, or feature requests, please open an issue on the GitHub repository.

If you would like to contribute to the project, please read the [CONTRIBUTING.md](https://github.com/payam-zahedi/toastification/blob/main/CONTRIBUTING.md "CONTRIBUTING.md") file for more information on how to contribute.

## License

Toastification is released under the `BSD-3-Clause` License. You can find the full text of the license in the LICENSE file in the root of the repository.

---

#### \* Written with the help of Chat GPT
