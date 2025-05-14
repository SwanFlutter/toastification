import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class StaticMethodExample extends StatelessWidget {
  const StaticMethodExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Static Method Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Using the static show method
                Toastification.show(
                  title: const Text('Success!'),
                  description: const Text('Operation completed successfully'),
                  type: ToastificationType.success,
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: const Duration(seconds: 3),
                );
              },
              child: const Text('Show Success Toast'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Using the static show method
                Toastification.show(
                  title: const Text('Error!'),
                  description: const Text('Something went wrong'),
                  type: ToastificationType.error,
                  style: ToastificationStyle.fillColored,
                  autoCloseDuration: const Duration(seconds: 3),
                );
              },
              child: const Text('Show Error Toast'),
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
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.star, color: Colors.white),
                          SizedBox(width: 12),
                          Text(
                            'Custom Static Toast',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Show Custom Toast'),
            ),
          ],
        ),
      ),
    );
  }
}
