# Changelog

## 0.2.0

* New `ToastificationStyle.glass`: a frosted-glass surface with backdrop blur,
  hairline border, and a circular tinted icon badge.
* New `ToastificationStyle.gradient`: a vivid type-colored diagonal gradient
  with a glow shadow and white content.
* `card` style: fixed the accent bar clipping artifact (it now renders as a
  clean rounded bar flush to the leading edge) and added a `chip` parameter
  that renders a small badge (e.g. a date) right after the title.
* `card` style: fixed "BoxConstraints forces an infinite height" when the toast
  is placed in a fixed-height or unbounded context (for example the example app
  style preview), which made the card render as an empty tile.

## 0.1.0

* New `ToastificationStyle.card`: an elegant card layout with a leading accent
  bar, a tinted rounded icon badge, and soft shadows. The accent bar flips to
  the right automatically in RTL layouts.
* Dark theme: all built-in styles adapt to `ThemeData.brightness`, and the
  `brightness` parameter now lets a single toast force light or dark colors.
* RTL support: `chat` and `card` styles follow `Directionality`, and the
  `direction` parameter overrides the text direction per toast.
* Example app: style picker includes `card`, plus a Dark theme toggle and a
  Persian (RTL) language switch that flips the whole demo layout.

## 0.0.1

* Initial release.
