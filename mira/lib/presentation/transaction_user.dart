import 'package:flutter/material.dart';
import 'package:mira/presentation/transactions_list.dart';
import 'package:mira/data/transactions_data.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({
    super.key,
    required this.addTransaction,
    required this.deleteTransaction,
  });

  final void Function(String title, double value, DateTime date) addTransaction;
  final void Function(String id) deleteTransaction;

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TransactionsList(
      transactions: transactions,
      deleteTransaction: widget.deleteTransaction,
    );
  }
}
