class MoneyModel {
  final String cost;
  final String name;
  final String id;
  final DateTime month;

  MoneyModel({
    required this.cost,
    required this.id,
    required this.name,
    required this.month,
  });
}

class Costs {
  // ignore: prefer_final_fields
  List<MoneyModel> _monthlyCost = [
    MoneyModel(
      cost: "350000",
      id: "c1",
      name: "Konditsioner kredit",
      month: DateTime.now(),
    ),
    MoneyModel(
        cost: "400000",
        id: "c2",
        name: "New York bilet",
        month: DateTime.now()),
    MoneyModel(
      cost: "365000",
      id: "c3",
      name: "AirPods",
      month: DateTime.now(),
    )
  ];

  List<MoneyModel> get monthlyCost {
    return _monthlyCost;
  }

  String sumOfCosts(DateTime month) {
    int summa = 0;
    for (MoneyModel model in _monthlyCost
        .where((cost) =>
            cost.month.month == month.month && cost.month.year == month.year)
        .toList()) {
      summa = summa + int.parse(model.cost);
    }
    return summa.toString();
  }

  String percantageOfCost(String summa, DateTime month) {
    String total = sumOfCosts(month);
    int totalOfInt = int.parse(total);
    int summaOfInt = int.parse(summa);
    if (totalOfInt < summaOfInt) {
      double percantage = (totalOfInt / summaOfInt) * 100;
      return percantage.toStringAsFixed(1);
    } else {
      return "100";
    }
  }

  List<MoneyModel> monthlyCostByDay(DateTime month) {
    return _monthlyCost
        .where((cost) =>
            cost.month.month == month.month && cost.month.year == month.year)
        .toList();
  }

  void removeCost(String id) {
    _monthlyCost.removeWhere((cost) => cost.id == id);
  }

  void addElement(String name, String cost, DateTime month) {
    monthlyCost.add(MoneyModel(
        cost: cost,
        id: "c${monthlyCost.length + 1}",
        name: name,
        month: month));
  }
}
