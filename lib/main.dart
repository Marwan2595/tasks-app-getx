import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_app/config/app_dependencies.dart';
import 'package:tasks_app/features/presentation/screens/tasks_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TasksScreen(),
    );
  }
}
