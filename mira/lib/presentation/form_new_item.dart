import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mira/models/theme.dart';

class FormNewItem extends StatefulWidget {
  const FormNewItem({required this.onSubmit, super.key});

  final Function(String, double, DateTime) onSubmit;

  @override
  State<FormNewItem> createState() => _FormNewItemState();
}

class _FormNewItemState extends State<FormNewItem> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    final date = selectedDate;

    if (title.isEmpty || value <= 0 || date == null) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text(
                'Erro!',
                style: TextStyle(color: MiraColors.verdeEscuro),
              ),
              content: const Text('Preencha todos os campos corretamente.'),
              backgroundColor: MiraColors.offWhite,
              alignment: Alignment.center,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
      );
      return;
    }

    widget.onSubmit(title, value, date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MiraColors.offWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Text(
                    'Adicionar Transação',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? MiraColors.verdeSalvia
                              : MiraColors.verdeEscuro,
                    ),
                  ),
                ),
              ],
            ),

            TextField(
              controller: _titleController,
              onSubmitted: (value) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle:
                    Theme.of(context).brightness == Brightness.dark
                        ? TextStyle(color: MiraColors.verdeSalvia)
                        : TextStyle(color: MiraColors.verdeEscuro),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? MiraColors.verdeSalvia
                            : MiraColors.verdeEscuro,
                  ),
                ),
              ),
              style: TextStyle(
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? MiraColors.verdeSalvia
                        : MiraColors.verdeEscuro,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _valueController,
              onSubmitted: (value) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                labelStyle:
                    Theme.of(context).brightness == Brightness.dark
                        ? TextStyle(color: MiraColors.verdeSalvia)
                        : TextStyle(color: MiraColors.verdeEscuro),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: MiraColors.verdeEscuro),
                ),
              ),
              style: TextStyle(
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? MiraColors.verdeSalvia
                        : MiraColors.verdeEscuro,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate != null
                      ? 'Data selecionada: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}'
                      : 'Selecione uma data:',
                ),
                ElevatedButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    ).then((pickedDate) {
                      if (pickedDate == null) {
                        return;
                      }
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MiraColors.offWhite,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(color: MiraColors.verdeEscuro),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      _submitForm();
                    },
                    icon: Icon(Icons.add, color: MiraColors.verdeEscuro),
                    label: Text(
                      'Adicionar Transação',
                      style: TextStyle(color: MiraColors.verdeEscuro),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: MiraColors.areiaDourada,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
