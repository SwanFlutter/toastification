import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toastification/toastification.dart';

void main() {
  group('StandardToastStyleFactory', () {
    test('creates MinimalStandardToastStyle', () {
      final style = StandardToastStyleFactory.createStyle(
        style: StandardStyle.minimal,
        type: ToastificationType.info,
      );

      expect(style, isA<MinimalStandardToastStyle>());
    });

    test('creates FilledStandardToastStyle', () {
      final style = StandardToastStyleFactory.createStyle(
        style: StandardStyle.fillColored,
        type: ToastificationType.success,
      );

      expect(style, isA<FilledStandardToastStyle>());
    });

    test('creates FlatStandardColoredToastStyle', () {
      final style = StandardToastStyleFactory.createStyle(
        style: StandardStyle.flatColored,
        type: ToastificationType.warning,
      );

      expect(style, isA<FlatStandardColoredToastStyle>());
    });

    test('creates FlatStandardToastStyle', () {
      final style = StandardToastStyleFactory.createStyle(
        style: StandardStyle.flat,
        type: ToastificationType.error,
      );

      expect(style, isA<FlatStandardToastStyle>());
    });

    test('creates SimpleStandardToastStyle', () {
      final style = StandardToastStyleFactory.createStyle(
        style: StandardStyle.simple,
        type: ToastificationType.info,
      );

      expect(style, isA<SimpleStandardToastStyle>());
    });

    test('creates CardStandardToastStyle', () {
      final style = StandardToastStyleFactory.createStyle(
        style: StandardStyle.card,
        type: ToastificationType.success,
      );

      expect(style, isA<CardStandardToastStyle>());
    });

    test('creates GlassStandardToastStyle', () {
      final style = StandardToastStyleFactory.createStyle(
        style: StandardStyle.glass,
        type: ToastificationType.info,
      );

      expect(style, isA<GlassStandardToastStyle>());
    });

    test('creates GradientStandardToastStyle', () {
      final style = StandardToastStyleFactory.createStyle(
        style: StandardStyle.gradient,
        type: ToastificationType.error,
      );

      expect(style, isA<GradientStandardToastStyle>());
    });

    test('card style uses dark palette when theme brightness is dark', () {
      final darkStyle = StandardToastStyleFactory.createStyle(
        style: StandardStyle.card,
        type: ToastificationType.success,
        flutterTheme: ThemeData(brightness: Brightness.dark),
      );
      final lightStyle = StandardToastStyleFactory.createStyle(
        style: StandardStyle.card,
        type: ToastificationType.success,
        flutterTheme: ThemeData(brightness: Brightness.light),
      );

      expect(darkStyle.backgroundColor, const Color(0xFF1E2533));
      expect(lightStyle.backgroundColor, Colors.white);
    });
  });
}
