import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Text(
                  "https://www.youtube.com/playlist?list=PL93xoMrxRJIvPg3nW8WG0HDDgpMQtUkag",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Checkbox(
                  value: true,
                  onChanged: (val) {
                    print(val);
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
