import 'package:expenxe_app/commons/styled_text.dart';
import 'package:expenxe_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 1,
      ),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 16,
          ),
          child: Column(
            spacing: 5,
            children: [
              StyledText(expense.title, 18, Colors.purple[700]),
              Row(
                children: [
                  StyledText(
                    '\$${expense.amount.toStringAsFixed(2)}',
                    16,
                    Colors.purple[600],
                  ),
                  Spacer(),
                  Row(
                    spacing: 5,
                    children: [
                      Icon(
                        categoryIcons[expense.category],
                        color: Colors.purple[600],
                      ),
                      StyledText(expense.formattedDate, 16, Colors.purple[600]),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
