import 'package:flutter/material.dart';
import 'package:personal_wallet/models/money_modeli.dart';

class ListOfCosts extends StatelessWidget {
  final MoneyModel element;
  final Function deleteCost;

  ListOfCosts(this.element, this.deleteCost);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: Icon(Icons.account_balance),
      title: Text(element.name),
      subtitle: Text(element.cost),
      trailing: IconButton(
        onPressed: () {
          deleteCost(element.id);
        },
        icon: const Icon(
          Icons.delete,
        ),
      ),
    );
  }
}
