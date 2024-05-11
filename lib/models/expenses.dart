//class as data model for expenses

//get unique id
import 'package:uuid/uuid.dart';

const uuid = Uuid();

//allowed value for category using enum
enum Category {
  food,
  travel,
  leisure,
  work,
}

class Expense {
  Expense({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
