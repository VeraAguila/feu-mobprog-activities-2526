import 'package:expenxe_app/commons/styled_text.dart';
import 'package:expenxe_app/expense/expense_list.dart';
import 'package:expenxe_app/expense/new_expense.dart';
import 'package:expenxe_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  State<ExpenseScreen> createState() {
    return _ExpenseScreen();
  }
}

class _ExpenseScreen extends State<ExpenseScreen> {
  final List<Expense> registeredExpenses = [
    Expense(
      title: 'Lunch sa Jollibee',
      amount: 300.49,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Team Building',
      amount: 1000.49,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Demon Slayer Movie',
      amount: 450.49,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void openExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
        addExpense: addExpense,
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);

    setState(() {
      registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
            registeredExpenses.insert(expenseIndex, expense);  
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No Expenses found. Try adding one!'),
    );

    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: registeredExpenses,
        removeExpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: StyledText('Expense Tracker', 24, Colors.white)),
        actions: [
          IconButton(
            onPressed: openExpenseModal,
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.purple[500],
      ),
      body: Column(
        children: [
          StyledText('Chart Area', 16, Colors.purple[700]),
          Expanded(
            child: mainContent,
          ),
        ],
        
      ),
      backgroundColor: Colors.purple[50],
    );
  }
}
