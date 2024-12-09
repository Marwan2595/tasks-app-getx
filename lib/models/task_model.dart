class TaskModel {
  String? title;
  bool isCompleted = false;
  TaskModel({this.title, this.isCompleted = false});

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() => {'title': title, 'isCompleted': isCompleted};
}
