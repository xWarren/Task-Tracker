class TaskModel {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  int? color;
  String? repeat;

  TaskModel(
      {this.id,
      this.title,
      this.note,
      this.isCompleted,
      this.date,
      this.color,
      this.repeat});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    color = json['color'];
    repeat = json['repeat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['note'] = note;
    data['isCompleted'] = isCompleted;
    data['date'] = date;
    data['color'] = color;
    data['repeat'] = repeat;
    return data;
  }
}
