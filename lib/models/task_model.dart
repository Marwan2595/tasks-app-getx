class TaskModel {
  int? id;
  String? title;
  bool isCompleted = false;
  TaskModel({this.id, this.title, this.isCompleted = false});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    isCompleted = json['isCompleted'] == 1;
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'isCompleted': isCompleted ? 1 : 0,
      };

  TaskModel copy({
    int? id,
    String? title,
    bool? isCompleted,
  }) =>
      TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}

const String tableTasks = 'tasks';

class TaskFields {
  static final List<String> values = [
    id,
    title,
    isCompleted,
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String isCompleted = 'isCompleted';
}
