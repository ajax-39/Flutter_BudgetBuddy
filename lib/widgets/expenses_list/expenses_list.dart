import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    required this.expenses,
    super.key,
  });

  final List<Expense> expenses;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(
        expense: expenses[index],
      ),
    );
  }
}
