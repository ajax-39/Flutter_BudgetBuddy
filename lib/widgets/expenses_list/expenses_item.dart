import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/widgets.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    required this.expense,
    super.key,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            //
            const SizedBox(
              height: 4,
            ),
            //
            Row(
              children: [
                Text(
                  '\$ ${expense.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                //
                const Spacer(),
                //
                Row(
                  children: [
                    Icon(catergoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      expense.formattedDate,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
