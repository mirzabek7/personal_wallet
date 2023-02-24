import 'package:flutter/material.dart';

class ModalWindowOfBudget extends StatefulWidget {
  final TextEditingController controller;
  final Function summa;
  ModalWindowOfBudget(this.controller, this.summa);

  @override
  State<ModalWindowOfBudget> createState() => _ModalWindowOfBudgetState();
}

class _ModalWindowOfBudgetState extends State<ModalWindowOfBudget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom + 16
                : 300),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Oylik byudjet miqdori"),
              controller: widget.controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Bekor qilish",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.summa();
                  },
                  child: Text(
                    "Kiritish",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
