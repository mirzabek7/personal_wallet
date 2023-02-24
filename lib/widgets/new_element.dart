import 'package:flutter/material.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';

class NewElement extends StatefulWidget {
  final Function addNewElement;
  NewElement(this.addNewElement);

  @override
  State<NewElement> createState() => _NewElementState();
}

class _NewElementState extends State<NewElement> {
  DateTime? newDate;
  final _controller = TextEditingController();
  final _costController = TextEditingController();
  void dateChooser(BuildContext context) {
    showMonthPicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    ).then((sana) {
      if (sana != null) {
        setState(() {
          newDate = sana;
        });
      }
    });
  }

  void submit() {
    if (_controller.text.isEmpty ||
        newDate == null ||
        _costController.text.isEmpty) {
      return;
    } else {
      setState(() {
        widget.addNewElement(_controller.text, _costController.text, newDate);
      });
    }
  }

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
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Xarid nomi"),
                  controller: _controller,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Narxi"),
                  controller: _costController,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(_newModalDate != null
                //     ? DateFormat("EEEE d.MM.yyyy").format(_newModalDate!)
                //     : "Kun tanlanmagan..."),
                TextButton(
                    onPressed: () {
                      dateChooser(context);
                    },
                    child: Text("OYNI TANLASH"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "BEKOR QILISH",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text("KIRITISH")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
