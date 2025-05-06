import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mira/data/transactions_data.dart';
import 'package:mira/models/theme.dart';
import 'package:mira/models/transaction.dart';
import 'package:mira/presentation/form_new_item.dart';
import 'package:mira/presentation/widget/chart.dart';
import 'package:mira/presentation/transaction_user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChart = false;
  late bool isDarkMode = false;

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
    bool isLandSpce =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: Text(
        'Mira',
        style: TextStyle(
          fontFamily: 'EduAUVICWANTArrows-Bold',
          fontSize: 30,
          color:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? MiraColors.verdeSalvia
                  : MiraColors.verdeEscuro,
        ),
      ),
      centerTitle: true,
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? MiraColors.verdeEscuro
              : MiraColors.verdeSalvia,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          height: 4.0,
          color:
              MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? MiraColors.verdeSalvia
                  : MiraColors.verdeEscuro,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          // Handle menu button press
        },
      ),
      actions: [
        isLandSpce
            ? IconButton(
              icon:
                  !isChart
                      ? Icon(Icons.stacked_line_chart_rounded)
                      : Icon(Icons.list),
              color: MiraColors.verdeEscuro,
              onPressed: () {
                setState(() {
                  isChart = !isChart;
                });
              },
            )
            : Container(),
        IconButton(
          onPressed: () {
            setState(() {
              isDarkMode ? isDarkMode = false : isDarkMode = true;
            });
          },
          icon: !isDarkMode ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
        ),
      ],
    );

    return MaterialApp(
      title: 'Mira',
      theme: miraLightTheme,
      darkTheme: miraDarkTheme,
      locale: const Locale('pt', 'BR'),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isChart || !isLandSpce)
                SizedBox(
                  height:
                      !isLandSpce
                          ? MediaQuery.of(context).size.height * 0.2
                          : 0.7 * MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chart(recentTransactions: recentTransactions),
                  ),
                ),
              !isChart || !isLandSpce
                  ? Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    height:
                        !isLandSpce
                            ? MediaQuery.of(context).size.height * 0.7
                            : 0.8 * MediaQuery.of(context).size.height,
                    child: TransactionUser(
                      addTransaction: addTransaction,
                      deleteTransaction: deleteTransaction,
                    ),
                  )
                  : Container(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(left: 40),
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? MiraColors.verdeEscuro
                        : MiraColors.verdeSalvia,
                context: context,
                builder: (context) {
                  return FormNewItem(onSubmit: addTransaction);
                },
              );
            },
            backgroundColor: MiraColors.areiaDourada,
            foregroundColor: MiraColors.verdeEscuro,
            shape: const CircleBorder(),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
