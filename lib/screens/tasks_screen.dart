import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks Screen')),
      body: const Center(
        child: Text('Tasks'),
      ),
    );
  }
}
