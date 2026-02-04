import 'package:fomato/models/todo/state.dart';

class TodoItem {
  final int id;
  late TodoState status;
  String title;
  String? content;
  final String createDate;
  String? startDate;
  String? endDate;

  TodoItem(
    this.id,
    this.title,
    this.createDate, {
    this.status = TodoState.todo,
    this.content,
    this.startDate,
    this.endDate,
  });
}
