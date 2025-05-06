import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mira/models/theme.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({
    required this.transactions,
    super.key,
    required this.deleteTransaction,
  });

  final List transactions;
  final void Function(String id) deleteTransaction;

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 520,
      width: double.infinity,
      child: ListView(
        children:
            widget.transactions.isEmpty
                ? [
                  const SizedBox(height: 50),
                  Icon(
                    Icons.not_listed_location_rounded,
                    color: MiraColors.verdeEscuro,
                    size: 50,
                  ),
                  const Text(
                    'Nenhuma transação cadastrada!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: MiraColors.verdeEscuro,
                    ),
                  ),
                  const SizedBox(height: 10),
                ]
                : widget.transactions.map<Widget>((tr) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: MiraColors.areiaDourada,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text(
                              tr.value.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? MiraColors.verdeSalvia
                                  : MiraColors.verdeEscuro,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        DateFormat('dd/MM/yyyy').format(tr.date),
                        style: const TextStyle(
                          fontSize: 16,
                          color: MiraColors.cinzaFume,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          widget.deleteTransaction(tr.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Transação excluída!'),
                              duration: const Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'Desfazer',
                                onPressed: () {
                                  setState(() {
                                    widget.transactions.add(tr);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.delete_outline_rounded),
                        color: MiraColors.areiaDourada,
                      ),
                    ),
                  );
                }).toList(),
      ),
    );
  }
}
