import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ErrorDetectionPage extends StatelessWidget {
  const ErrorDetectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error Detection')),
      body: const Center(child: Text('Error Detection Page')),
    );
  }
}