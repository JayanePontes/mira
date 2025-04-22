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
  late bool isDarkMode;

  @override
  void initState() {
    super.initState();
    isDarkMode = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mira',
      theme: miraLightTheme,
      darkTheme: miraDarkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      locale: const Locale('pt', 'BR'),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Mira',
            style: TextStyle(
              fontFamily: 'EduAUVICWANTArrows-Bold',
              fontSize: 30,
              color:
                  isDarkMode ? MiraColors.verdeSalvia : MiraColors.verdeEscuro,
            ),
          ),
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
