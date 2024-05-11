//class as data model for expenses
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//get unique id
import 'package:uuid/uuid.dart';

const uuid = Uuid();

//formate date using intl package
final formatter = DateFormat.yMd();

//allowed value for category using enum
enum Category {
  food,
  travel,
  leisure,
  work,
}

const catergoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

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

  String get formattedDate {
    return formatter.format(date);
  }
}
