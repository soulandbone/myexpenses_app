import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expenses_app/widgets/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  //const Chart({Key? key}) : super(key: key);

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get lastWeekTransactions {
    return List.generate(7, (index) {
      final weekDay = (DateTime.now().subtract(Duration(days: index)));
      var totalAmount = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmount += recentTransactions[i].amount;
        }
      }

      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 1),
        'Amount': totalAmount
      };
    });
  }

  double get totalSpending {
    return lastWeekTransactions.fold(0.0, (sum, element) {
      return sum + (element['Amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(lastWeekTransactions); //print in the build method
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: lastWeekTransactions.map((item) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                '${item['Day']}',
                (item['Amount'] as double),
                totalSpending == 0
                    ? 0.0
                    : (item['Amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
