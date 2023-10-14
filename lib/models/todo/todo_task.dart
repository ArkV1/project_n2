import 'dart:convert';

class ToDoTask {
  String? id;
  String toDoListId;
  final String task;
  final String? description;
  bool isDaily;
  bool complete;
  DateTime? creationDate;
  DateTime? completionDate;

  ToDoTask({
    this.id,
    required this.toDoListId,
    required this.task,
    this.description,
    this.isDaily = false,
    this.complete = false,
    this.creationDate,
    this.completionDate,
  }) {
    creationDate ??= DateTime.now();
  }

  factory ToDoTask.fromMap(
    Map<String, dynamic> data,
  ) {
    return ToDoTask(
      id: data['id'],
      toDoListId: data['todoListId'],
      task: data['task'],
      description: data['description'],
      isDaily: data['isDaily'] == 1,
      complete: data['complete'] == 1,
      creationDate: DateTime.parse(data['creationDate']),
      completionDate: data['completionDate'] != null
          ? DateTime.parse(data['completionDate'])
          : null,
    );
  }

  factory ToDoTask.fromText(
    String encodedString,
  ) {
    final valueMap = json.decode(encodedString);
    return ToDoTask.fromMap(valueMap);
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'todoListId': toDoListId,
      'task': task,
      if (id != null) 'description': description,
      'isDaily': isDaily ? 1 : 0,
      'complete': complete ? 1 : 0,
      'creationDate': creationDate.toString(),
      if (completionDate != null) 'completionDate': completionDate.toString(),
    };
  }

  String toText() {
    final valueMap = toMap();
    return jsonEncode(valueMap);
  }

  // factory Transaction.fromFirestore(
  //   Map<String, dynamic> data,
  // ) {
  //   return Transaction(
  //     data['title'],
  //     data['amount'],
  //     data['date'].toDate(),
  //     data['currency'],
  //   );
  // }

  // Map<String, dynamic> toFirestore() {
  //   return {
  //     "title": title,
  //     "amount": amount,
  //     "date": date,
  //     if (currency != null) "currency": currency,
  //   };
  // }
}
