import 'package:expenxe_app/expense/exepense_item.dart';
import 'package:expenxe_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
