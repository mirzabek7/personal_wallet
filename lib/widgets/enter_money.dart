import 'package:flutter/material.dart';
import 'package:personal_wallet/models/money_modeli.dart';

class EnterMoney extends StatelessWidget {
  final String summa;
  final Function addModelWindow;
  final Costs costs;
  final DateTime month;

  EnterMoney(this.summa, this.addModelWindow, this.costs, this.month);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            // ignore: prefer_const_constructors
            Text(
              "Oylik daromad: ",
              style: const TextStyle(fontSize: 18),
            ),
            TextButton.icon(
              onPressed: () {
                addModelWindow(context);
              },
              icon: Icon(
                Icons.edit_note_rounded,
                size: 30,
              ),
              // ignore: prefer_const_constructors
              label: Text(
                summa,
                style: const TextStyle(fontSize: 18),
              ),
            )
          ]),
          // ignore: prefer_const_constructors
          Text(
            "${costs.percantageOfCost(summa, month)}%",
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
