// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';
import 'package:personal_wallet/models/money_modeli.dart';
import 'package:personal_wallet/widgets/modal_window_of_budget.dart';

import './widgets/DateAndMoney.dart';
import './widgets/enter_money.dart';
import 'widgets/catalog.dart';
import './widgets/new_element.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wallet(),
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

class Wallet extends StatefulWidget {
  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  DateTime _currentMonth = DateTime.now();
  Costs monthlyCosts = Costs();
  final controller = TextEditingController();
  String summa = "10000000";
  void sumOfBudget() {
    // ignore: unnecessary_null_comparison
    if (controller.text != null) {
      setState(() {
        summa = controller.text;
      });
    }
    Navigator.of(context).pop();
  }

  void _addModelWindow(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return ModalWindowOfBudget(controller, sumOfBudget);
      },
    );
  }

  void dateChooser(BuildContext context) {
    showMonthPicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    ).then((sana) {
      if (sana != null) {
        setState(() {
          _currentMonth = sana;
        });
      }
    });
  }

  void nextMonth() {
    setState(() {
      _currentMonth = DateTime(
          _currentMonth.year, _currentMonth.month + 1, _currentMonth.day);
    });
  }

  void lastMonth() {
    setState(() {
      _currentMonth = DateTime(
          _currentMonth.year, _currentMonth.month - 1, _currentMonth.day);
    });
  }

  void deleteCost(String id) {
    setState(() {
      monthlyCosts.removeCost(id);
    });
  }

  void _addNewElement(String name, String cost, DateTime date) {
    setState(() {
      monthlyCosts.addElement(name, cost, date);
    });
    Navigator.of(context).pop();
  }

  void addElementWindow(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return NewElement(_addNewElement);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mening Hamyonim"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              addElementWindow(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 35.0, left: 16.0, right: 16.0, bottom: 35.0),
        child: Column(
          children: [
            DateAndMoney(dateChooser, _currentMonth, lastMonth, nextMonth,
                monthlyCosts.sumOfCosts(_currentMonth)),
            EnterMoney(summa, _addModelWindow, monthlyCosts, _currentMonth),
            Catalog(monthlyCosts.monthlyCostByDay(_currentMonth), deleteCost),
          ],
        ),
      ),
    );
  }
}
