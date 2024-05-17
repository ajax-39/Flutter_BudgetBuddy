import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registerdExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 599.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 20.15,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  //add expense from user
  void _addExpense(Expense expense) {
    setState(() {
      registerdExpenses.add(expense);
    });
  }

  //remove expense
  void _removeExpense(Expense expense) {
    setState(() {
      registerdExpenses.remove(expense);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          ),
        ],
      ),
      //
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: ExpenseList(
              expenses: registerdExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
