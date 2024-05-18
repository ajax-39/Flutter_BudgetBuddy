import 'package:expense_tracker/models/expenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //#1 method to input value
  // var _enteredTitle = "";
  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  //#2 method to input value
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  //#validate input
  void _submitExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = (enteredAmount == null) || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure a valid title,amount,date and category was enterd'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    } else {
      widget.onAddExpense(
        Expense(
          title: _titleController.text,
          date: _selectedDate!,
          amount: enteredAmount,
          category: _selectedCategory,
        ),
      );

      Navigator.pop(context);
    }
  }

  //=====================================================

  //#date picker
  DateTime? _selectedDate;
  final formatter = DateFormat.yMd();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstData = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );
    //
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstData,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  //=====================================================

  //#value from dropdown menu
  var _selectedCategory = Category.work;

  @override
  Widget build(context) {
    //overlapping keyboard

    final keyboard = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, 16 + keyboard),
          child: Column(
            children: [
              //input the data
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text(
                    'Title',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\$ ',
                        label: Text(
                          'Enter Amount',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //
                  const SizedBox(
                    width: 16,
                  ),
                  //
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'No Date Selected'
                              : formatter.format(_selectedDate!),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        //
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        )
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  ElevatedButton(
                    onPressed: _submitExpense,
                    child: const Text('Save Expense'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
