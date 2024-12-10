import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_app/controllers/tasks_controller.dart';
import 'package:tasks_app/models/task_model.dart';
import 'package:tasks_app/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TasksController tasksController = Get.put(TasksController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Get.bottomSheet(
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Add Task",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Obx(
                      () => Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Task Title",
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Task title is required";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                tasksController.newTask.value.title = value;
                                print(tasksController.newTask.value.title);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Is Completed"),
                                Checkbox(
                                  value:
                                      tasksController.newTask.value.isCompleted,
                                  onChanged: (value) {
                                    tasksController.newTask.value.isCompleted =
                                        value!;
                                    tasksController.newTask.refresh();
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 160,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await tasksController
                                        .addTask(tasksController.newTask.value);
                                    tasksController.newTask.value = TaskModel(
                                        title: "", isCompleted: false);
                                    Get.back();
                                  }
                                },
                                child: const Text(
                                  "Add Task",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 3,
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
