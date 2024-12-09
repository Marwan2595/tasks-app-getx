import 'package:flutter/material.dart';
import 'package:tasks_app/models/task_model.dart';
import 'package:tasks_app/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  List<TaskModel> testTasksList = [
    TaskModel(title: "Task 1", isCompleted: false),
    TaskModel(title: "Task 2", isCompleted: false),
    TaskModel(title: "Task 3", isCompleted: false),
    TaskModel(title: "Task 4", isCompleted: true),
    TaskModel(title: "Task 5", isCompleted: true),
    TaskModel(title: "Task 6", isCompleted: true),
    TaskModel(title: "Task 7", isCompleted: false),
    TaskModel(title: "Task 8", isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 24, bottom: 24),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "To-DO List",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                // width: 200,
                // height: 500,
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      TaskCard(taskModel: testTasksList[index]),
                  itemCount: testTasksList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
