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
    final expenseIndex = registerdExpenses.indexOf(expense);

    setState(() {
      registerdExpenses.remove(expense);
    });

    //info message
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registerdExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No Expense found.Start adding some!'),
    );

    if (registerdExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: registerdExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
