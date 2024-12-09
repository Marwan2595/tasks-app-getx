import 'package:flutter/material.dart';
import 'package:tasks_app/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
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
          margin: const EdgeInsets.only(
            top: 24,
          ),
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
                child: ListView(
                  children: [
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
