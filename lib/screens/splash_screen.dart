import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expire Notifier App'),
      ),
      body: const Center(
        child: Text('loading'),
      ),
    );
  }
}
