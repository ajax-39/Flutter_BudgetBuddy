import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    required this.expenses,
    required this.onRemoveExpense,
    super.key,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
