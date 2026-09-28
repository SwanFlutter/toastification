import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toastification/toastification.dart';

void main() {
  testWidgets('card preview renders inside example-style Stack/Positioned',
      (tester) async {
    const style = CardStandardToastStyle(type: ToastificationType.success);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 98,
            child: Stack(
              children: [
                Positioned(
                  top: 12,
                  left: 30,
                  right: -40,
                  child: ToastificationTheme(
                    themeData: ToastificationThemeData(
                      toastStyle: style,
                      flutterTheme: ThemeData(),
                      direction: TextDirection.ltr,
                    ),
                    child: const CardStandardToastWidget(
                      title: Text('The Provided Title'),
                      description: Text('The Provided Description'),
                      onCloseTap: _noop,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('The Provided Title'), findsOneWidget);
  });
}

void _noop() {}
