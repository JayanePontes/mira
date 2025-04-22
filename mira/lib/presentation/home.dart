import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mira/data/transactions_data.dart';
import 'package:mira/models/theme.dart';
import 'package:mira/models/transaction.dart';
import 'package:mira/presentation/widget/chart.dart';
import 'package:mira/presentation/transaction_user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  List<Transaction> get recentTransactions {
    return transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void addTransaction(String title, double value, DateTime date) {
    if (title.isEmpty || value <= 0) {
      return;
    }
    setState(() {
      transactions.add(
        Transaction(
          id: Random().nextDouble().toString(),
          title: title,
          value: value,
          date: date,
        ),
      );
    });
    Navigator.of(context).pop();
  }

  void deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chart(recentTransactions: recentTransactions),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: const Text(
                'Lista de transações',
                style: TextStyle(
                  fontFamily: 'EduAUVICWANTArrows-Bold',
                  fontSize: 20,
                  color: MiraColors.verdeEscuro,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TransactionUser(
              addTransaction: addTransaction,
              deleteTransaction: deleteTransaction,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
