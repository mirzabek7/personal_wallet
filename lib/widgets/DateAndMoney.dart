import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_wallet/models/money_modeli.dart';

class DateAndMoney extends StatelessWidget {
  final Function dateChoooser;
  final DateTime month;
  final Function nextMonth;
  final Function lastMonth;
  final String sumOfCosts;

  DateAndMoney(this.dateChoooser, this.month, this.lastMonth, this.nextMonth,
      this.sumOfCosts);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: TextButton(
          onPressed: () {
            dateChoooser(context);
          },
          child: Text(
            DateFormat.yMMMM().format(month),
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  lastMonth();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                ),
              ),
              Text(
                sumOfCosts,
                style: TextStyle(fontSize: 50),
              ),
              IconButton(
                onPressed: () {
                  nextMonth();
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 35,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
