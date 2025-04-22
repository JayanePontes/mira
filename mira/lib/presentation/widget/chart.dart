import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mira/data/transactions_data.dart';
import 'package:mira/models/transaction.dart';
import 'package:mira/presentation/widget/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (i) {
      final weekDay = DateTime.now().subtract(Duration(days: i));
      double totalSum = 0.0;

      for (i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'amount': totalSum};
    }).reversed.toList();
  }

  double get weekTotalValue {
    double total = 0;
    for (var i = 0; i < transactions.length; i++) {
      total += transactions[i].value;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactionValues;
    return Card(
      elevation: 10,
      child: Row(
        children: [
          ...groupedTransactionValues.map((tr) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChartBar(
                  label: tr['day'].toString(),
                  value: tr['amount'] as double,
                  percent:
                      weekTotalValue == 0
                          ? 0.0
                          : (tr['amount'] as double) / weekTotalValue,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
