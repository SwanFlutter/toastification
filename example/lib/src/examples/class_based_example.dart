import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ClassBasedExample extends StatelessWidget {
  const ClassBasedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class-Based Toastification Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Using the static show method
                Toastification.show(
                  title: const Text('Hello World'),
                  description: const Text('This is a notification'),
                  type: ToastificationType.info,
                  style: ToastificationStyle.flat,
                  autoCloseDuration: const Duration(seconds: 3),
                );
              },
              child: const Text('Show Toast (Static Method)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Using the static showCustom method
                Toastification.showCustom(
                  alignment: Alignment.topRight,
                  animationDuration: const Duration(milliseconds: 500),
                  autoCloseDuration: const Duration(seconds: 3),
                  builder: (context, item) {
                    return Container(
                      width: 400,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'This is a custom toast',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                );
              },
              child: const Text('Show Custom Toast (Static Method)'),
            ),
          ],
        ),
      ),
    );
  }
}
