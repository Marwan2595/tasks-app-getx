import 'package:flutter/material.dart';
import 'package:tasks_app/models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskModel,
    required this.onComplete,
  });
  final VoidCallback onComplete;
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  taskModel.title ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    decoration: taskModel.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              Expanded(
                child: Checkbox(
                  value: taskModel.isCompleted,
                  onChanged: (val) {
                    onComplete();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
