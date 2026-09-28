# Toastification

[Pub Version](https://pub.dev/packages/toastification)  
[License: BSD-3-Clause](LICENSE)

A complete and customizable Flutter package for displaying beautiful toast notifications — with 9 ready-made styles, smart light/dark theme support, full right-to-left (RTL) support for Persian and Arabic apps, and fine-grained control over icon, color, animation, progress bar, and dismissal behavior.

[**View the interactive demo**](https://swanflutter.github.io/toastification/) · [GitHub repository](https://github.com/SwanFlutter/toastification)

---

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Initial Setup (Required)](#initial-setup-required)
- [Toast Types](#toast-types)
- [Built-in Styles](#built-in-styles)
- [Global Configuration (ToastificationConfig)](#global-configuration-toastificationconfig)
- [Custom Toast](#custom-toast)
- [Themes and Colors](#themes-and-colors)
- [RTL / Persian and Arabic](#rtl--persian-and-arabic)
- [Animations](#animations)
- [Interactions and Events (Callbacks)](#interactions-and-events-callbacks)
- [Managing Toasts (Dismiss)](#managing-toasts-dismiss)
- [Close Button](#close-button)
- [Progress Bar](#progress-bar)
- [Project Structure](#project-structure)
- [Running the Example App](#running-the-example-app)

---

## Installation

Add the package to your project:

```shell
flutter pub add toastification
```

Or manually in `pubspec.yaml`:

```yaml
dependencies:
  toastification: ^0.2.0
```

Then import the file:

```dart
import 'package:toastification/toastification.dart';
```

> **Requirements:** Flutter `>=1.17.0` and Dart `^3.13.1`

---

## Quick Start

```dart
toastification.show(
  context: context,
  title: const Text('Hello!'),
  description: const Text('Your toast was displayed successfully.'),
  type: ToastificationType.success,
  style: ToastificationStyle.flat,
  autoCloseDuration: const Duration(seconds: 3),
);
```

Simply place a `ToastificationWrapper` at the top of your widget tree once; then you can show toasts anywhere you have access to a `BuildContext`.

---

## Initial Setup (Required)

For the static methods to work without a context, and to access the global settings, wrap your entire app with `ToastificationWrapper`:

```dart
ToastificationWrapper(
  config: const ToastificationConfig(
    alignment: AlignmentDirectional.topEnd,
    itemWidth: 400,
    maxToastLimit: 10,
  ),
  child: MaterialApp(
    title: 'My Application',
    theme: lightTheme,
    darkTheme: darkTheme,
    home: const HomePage(),
  ),
);
```

> If your app does not include a `Navigator`, you will get an error when showing a toast. This widget must be placed above the `MaterialApp` (or `CupertinoApp`).
>
> Placing more than one `ToastificationWrapper` in the widget tree causes an error.

**Alternative approach:** you can use the `context` instead of the wrapper; in that case, the overlay is found with `Overlay.maybeOf(context, rootOverlay: true)`.

---

## Toast Types

There are four built-in types with default colors and icons. The toast type determines the style's color and icon:


| Type                         | Color            | Use case               |
| ---------------------------- | ---------------- | ---------------------- |
| `ToastificationType.info`    | Blue `#47AFFF`   | Informational messages |
| `ToastificationType.success` | Green `#32BC32`  | Successful operations  |
| `ToastificationType.warning` | Orange `#FFB600` | Warnings               |
| `ToastificationType.error`   | Red `#FF3A30`    | Errors                 |


Create your own custom type:


```dart
final customType = ToastificationType.custom(
  'custom',
  Colors.purple,
  Icons.star,
);
```

Use it in `show`:

```dart
toastification.show(
  context: context,
  type: customType,
  title: const Text('Custom toast'),
);
```

> If `type` is not specified, `success` is used as the default.

---

## Built-in Styles

There are 9 ready-made styles, selected with `style:`:


| Style         | Appearance                                            | Best for                            |
| ------------- | ----------------------------------------------------- | ----------------------------------- |
| `flat`        | Neutral surface with a colored icon based on the type | General-purpose toasts              |
| `flatColored` | Soft colored surface with a colored border            | Friendly confirmations              |
| `fillColored` | Fully colored surface based on the type               | Important alerts                    |
| `minimal`     | Simple surface with a subtle border                   | Dense interfaces                    |
| `simple`      | Text only, no icon                                    | Short messages                      |
| `chat`        | Chat bubble with an icon badge                        | Chat streams                        |
| `card`        | Colored side bar + icon badge + optional `chip`       | Notifications and time-based events |
| `glass`       | Frosted glass surface with real blur                  | Modern interfaces                   |
| `gradient`    | Diagonal color gradient with a glow                   | Success moments and marketing       |


> The default `style`, if not specified, is `flat`.

### `card` — Colored bar and chip

The `card` style features a colored bar on the leading edge (right in RTL, left in LTR), a colored icon badge, and an optional `chip` displayed immediately after the title:

```dart
toastification.show(
  context: context,
  title: const Text('Founding of the Achaemenid Empire'),
  chip: Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color: Colors.amber.withValues(alpha: .18),
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Text(
      '550 BC',
      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w600),
    ),
  ),
  description: const Text('Cyrus the Great founded the Achaemenid Empire.'),
  style: ToastificationStyle.card,
  type: ToastificationType.info,
);
```

### `glass` — Glass blur

The `glass` style uses a real `BackdropFilter` with `sigma = 16` beneath a semi-transparent surface with a very subtle border. To see the effect, the toast must sit over meaningful content. This style automatically adapts to both light and dark themes.

### `gradient` — Gradient with glow

The `gradient` style paints the surface with a diagonal gradient based on the toast type's color and adds a matching glow shadow. The title, description, and icon are rendered in white in both themes.

---

## Global Configuration (ToastificationConfig)

To change the default values of `show` and `showCustom`, use `ToastificationConfig`:

```dart
ToastificationWrapper(
  config: ToastificationConfig(
    alignment: AlignmentDirectional.topEnd,
    itemWidth: 400,
    clipBehavior: Clip.none,
    animationDuration: const Duration(milliseconds: 600),
    marginBuilder: (context, alignment) => const EdgeInsets.only(top: 12),
    applyMediaQueryViewInsets: true,
    maxToastLimit: 10,
    maxTitleLines: 2,
    maxDescriptionLines: 6,
  ),
  child: app,
)
```


| Property                    | Default                         | Description                                               |
| --------------------------- | ------------------------------- | --------------------------------------------------------- |
| `alignment`                 | `AlignmentDirectional.topEnd`   | Position of toasts on the screen                          |
| `itemWidth`                 | `400.0`                         | Width of each toast                                       |
| `clipBehavior`              | `Clip.none`                     | Behavior of the underlying `AnimatedList`                 |
| `animationDuration`         | `600ms`                         | Duration of the enter/exit animation                      |
| `animationBuilder`          | `defaultAnimationBuilderConfig` | Global animation builder                                  |
| `marginBuilder`             | Based on `alignment.y`          | Margin around the toast container                         |
| `applyMediaQueryViewInsets` | `true`                          | Shift toasts when the keyboard is open                    |
| `maxToastLimit`             | `10`                            | Maximum number of simultaneous toasts (oldest is removed) |
| `maxTitleLines`             | `2`                             | Maximum title lines (truncated with `...`)                |
| `maxDescriptionLines`       | `6`                             | Maximum description lines                                 |


> With `ToastificationConfigProvider` you can also override the configuration in parts of the widget tree.

---

## Custom Toast

For a fully custom toast, use `showCustom`. Just return your own widget in the `builder`; you also have access to the `ToastificationItem`:

```dart
toastification.showCustom(
  alignment: Alignment.topRight,
  animationDuration: const Duration(milliseconds: 500),
  autoCloseDuration: const Duration(seconds: 3),
  builder: (context, item) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Colors.black87,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'My custom toast',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  },
);
```

---

## Themes and Colors

All built-in styles derive their coloring from `ThemeData.brightness`:

- **Light theme:** white surface / soft colors based on the type
- **Dark theme:** dark surface (`#1E2533`–`#202532`) with near-white text

Just set both `theme` and `darkTheme` in `MaterialApp` so the toasts follow `ThemeMode`:

```dart
MaterialApp(
  theme: lightTheme,
  darkTheme: darkTheme,
  themeMode: ThemeMode.system,
);
```

**Force light/dark mode for a single toast:**

```dart
toastification.show(
  context: context,
  title: const Text('Saved'),
  style: ToastificationStyle.card,
  brightness: Brightness.dark, // or Brightness.light
);
```

**Override colors:**

```dart
toastification.show(
  context: context,
  title: const Text('Colored toast'),
  primaryColor: Colors.purple,
  backgroundColor: Colors.purple.shade50,
  foregroundColor: Colors.purple.shade900,
);
```

> The `primaryColor` is automatically converted to a `MaterialColor` so that color swatches are available to the styles.

---

## RTL / Persian and Arabic

Full right-to-left support. The toast aligns with the upstream `Directionality`; layout, text direction, icon position, colored bar, and close button are all mirrored automatically:

```dart
toastification.show(
  context: context,
  title: const Text('A new update is available'),
  description: const Text('Changes were applied successfully.'),
  style: ToastificationStyle.chat,
  direction: TextDirection.rtl, // optional; otherwise inherited from Directionality
);
```

> If you pass a `context`, the toast automatically picks up `Directionality.of(context)`, so in RTL apps there is no need to pass `direction`.
>
> The `chat`, `card`, `glass`, and `gradient` styles are fully direction-aware.

---

## Animations

The default animation (`DefaultToastificationTransition`) combines **Fade + Slide**; the slide direction is determined by the `alignment` (top toasts slide in from the top, bottom ones from the bottom, and side ones from the side).

Create a custom animation:

```dart
toastification.show(
  context: context,
  title: const Text('With a custom animation'),
  animationDuration: const Duration(milliseconds: 800),
  animationBuilder: (context, animation, alignment, child) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.elasticOut),
      child: child,
    );
  },
);
```

The animation duration can be set per toast via `animationDuration`, or globally via `ToastificationConfig.animationDuration`.

---

## Interactions and Events (Callbacks)

To listen to toast lifecycle events, use `ToastificationCallbacks`:

```dart
toastification.show(
  context: context,
  title: const Text('Try out the events'),
  callbacks: ToastificationCallbacks(
    onTap: (item) => debugPrint('Tapped: ${item.id}'),
    onCloseButtonTap: (item) => debugPrint('Close button: ${item.id}'),
    onAutoCompleteCompleted: (item) => debugPrint('Time is up: ${item.id}'),
    onDismissed: (item) => debugPrint('Dismissed by drag: ${item.id}'),
  ),
);
```


| Event                     | When it fires                                                        |
| ------------------------- | -------------------------------------------------------------------- |
| `onTap`                   | When the user taps the toast                                         |
| `onCloseButtonTap`        | When the close button is pressed (default behavior: close the toast) |
| `onAutoCompleteCompleted` | When `autoCloseDuration` ends                                        |
| `onDismissed`             | When dismissed with a (swipe) gesture                                |


> If you override `onCloseButtonTap`, you must handle closing the toast yourself, since the default behavior is replaced.

---

## Managing Toasts (Dismiss)

All methods are available on the `Toastification` instance (or the `toastification` singleton):

```dart
// Close a specific toast
final item = toastification.show(context: context, title: const Text('Short'));
toastification.dismiss(item);

// Close by id
toastification.dismissById(item.id);

// Close all toasts on the screen
toastification.dismissAll(delayForAnimation: true);
```


| Method                                   | Description                     |
| ---------------------------------------- | ------------------------------- |
| `dismiss(item, {showRemoveAnimation})`   | Closes a toast                  |
| `dismissById(id, {showRemoveAnimation})` | Closes a toast by id            |
| `dismissAll({delayForAnimation})`        | Closes all toasts               |
| `findToastificationItem(id)`             | Finds a toast by id (or `null`) |


**Per-toast interaction settings:**


| Property            | Default                       | Description                     |
| ------------------- | ----------------------------- | ------------------------------- |
| `autoCloseDuration` | `null` (never closes)         | Time until auto-close           |
| `pauseOnHover`      | `true`                        | Pauses the timer on mouse hover |
| `closeOnClick`      | `false`                       | Close on click                  |
| `dragToClose`       | `true`                        | Allow dragging to close         |
| `dismissDirection`  | `DismissDirection.horizontal` | Allowed drag direction          |


---

## Close Button

With `closeButton` you can control the behavior and appearance of the close button:

```dart
toastification.show(
  context: context,
  title: const Text('Without a close button'),
  closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
);
```

Three display modes with `CloseButtonShowType`:

- `always` — always displayed
- `onHover` — only on mouse hover
- `none` — never displayed

Build a custom button:

```dart
ToastCloseButton(
  showType: CloseButtonShowType.always,
  buttonBuilder: (context, onClose) {
    return IconButton(
      icon: const Icon(Icons.clear),
      onPressed: onClose,
    );
  },
)
```

---

## Progress Bar

Display the toast's remaining time as a progress bar:

```dart
toastification.show(
  context: context,
  title: const Text('Uploading...'),
  showProgressBar: true,
  pauseOnHover: true,
  autoCloseDuration: const Duration(seconds: 5),
  progressBarTheme: const ProgressIndicatorThemeData(
    color: Colors.blue,
    linearMinHeight: 4,
  ),
);
```

The progress bar is synchronized with the internal timer and pauses with `pauseOnHover`. To build a custom bar, use `ToastTimerAnimationBuilder`.

---

## Project Structure

```
lib/
├── toastification.dart              # Public export point
└── src/
    ├── toastification_class.dart    # Core class: show, showCustom, dismiss...
    ├── core/
    │   ├── toastification.dart      # toastification singleton
    │   ├── toastification_config.dart       # Global configuration
    │   ├── toastification_item.dart         # Toast model + timer
    │   ├── toastification_callbacks.dart    # Events
    │   ├── toastification_manager.dart      # Overlay and list management
    │   ├── toastification_overlay_state.dart# ToastificationWrapper
    │   └── widget/                          # Animation and ConfigProvider
    ├── built_in/
    │   ├── toastification_style.dart        # Style enum
    │   ├── toastification_type.dart         # Toast types
    │   ├── built_in_builder.dart            # Built-in toast builder
    │   ├── theme/                           # ToastificationThemeData
    │   ├── widget/common/                   # Content, close button, hover
    │   └── layout/standard/
    │       ├── style/                       # 9 styles + factory
    │       └── toast/                        # 9 layout widgets
    └── utils/                               # Color and theme utilities
```

The package architecture is based on the **factory pattern**:

- `StandardToastStyleFactory` — builds the appropriate style based on `ToastificationStyle`
- `StandardToastWidgetFactory` — builds the appropriate layout widget based on the style

---

## Running the Example App

In the `example` folder there is a complete interactive app that previews all the styles:

```shell
cd example
flutter pub get
flutter run -d chrome
```

In this app you can see all the styles (including `card`, `glass`, and `gradient`), toggle light/dark theme, and enable the Persian RTL mode, which mirrors the entire layout and sample content.

For desktop:

```shell
flutter run -d windows
flutter run -d linux
flutter run -d macos
```

---

## Dependencies


| Package           | Purpose                             |
| ----------------- | ----------------------------------- |
| `equatable`       | Object equality comparison          |
| `uuid`            | Unique identifier for each toast    |
| `pausable_timer`  | Pausable timer (for `pauseOnHover`) |
| `collection`      | List helper utilities               |
| `iconsax_flutter` | Default icons for toast types       |


---

## License

This project is released as open source. See the [LICENSE](LICENSE) file for details.