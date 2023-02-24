import 'package:flutter/material.dart';
import 'package:personal_wallet/models/money_modeli.dart';

import 'list_of_costs.dart';

class Catalog extends StatelessWidget {
  final List<MoneyModel> monthlyCosts;
  final Function deleteCost;

  Catalog(this.monthlyCosts, this.deleteCost);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (ctx, index) {
        return ListOfCosts(monthlyCosts[index], deleteCost);
      },
      itemCount: monthlyCosts.length,
    ));
  }
}
