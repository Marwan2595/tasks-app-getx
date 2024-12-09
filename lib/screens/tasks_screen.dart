import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_app/controllers/tasks_controller.dart';
import 'package:tasks_app/models/task_model.dart';
import 'package:tasks_app/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TasksController tasksController = Get.put(TasksController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          tasksController.addTask(
            TaskModel(
              title: "Task ${tasksController.tasks.length + 1}",
            ),
          );
        },
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
              Obx(
                () {
                  return tasksController.loadingTasks.value
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView.builder(
                            itemCount: tasksController.tasks.length,
                            itemBuilder: (context, index) => TaskCard(
                              taskModel: tasksController.tasks[index],
                              onComplete: () {
                                tasksController
                                    .completeTask(tasksController.tasks[index]);
                                // tasksController.tasks.refresh();
                              },
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
