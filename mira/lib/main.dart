import 'package:flutter/material.dart';
import 'package:mira/models/theme.dart';
import 'package:mira/presentation/home.dart';

void main(List<String> args) {
  runApp(Expense());
}

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: MyHomePage()));
  }
}
