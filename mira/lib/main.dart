import 'package:flutter/material.dart';
import 'package:mira/theme.dart';

void main(List<String> args) {
  runApp(Expense());
}

class Expense extends StatefulWidget {
  Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  late bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mira',
      theme: miraLightTheme,
      darkTheme: miraDarkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mira'),
          centerTitle: true,
          backgroundColor:
              isDarkMode ? MiraColors.verdeEscuro : MiraColors.verdeSalvia,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              height: 4.0,
              color:
                  isDarkMode ? MiraColors.verdeSalvia : MiraColors.verdeEscuro,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
          actions: [
            IconButton(
              icon:
                  isDarkMode
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode),
              onPressed: () {
                if (isDarkMode) {
                  setState(() {
                    isDarkMode = false;
                  });
                } else {
                  setState(() {
                    isDarkMode = true;
                  });
                }
              },
            ),
          ],
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Hello, Expense Tracker!'));
  }
}
