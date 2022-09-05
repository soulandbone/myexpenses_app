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

  @override
  Widget build(BuildContext context) {
    print(lastWeekTransactions); //print in the build method
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(5),
      child: Row(
        children: lastWeekTransactions.map((item) {
          return ChartBar('${item['Day']}', (item['Amount']) as double, 0.5);
          // return Text('${data['Day']} : ${data['Amount']}');
        }).toList(),
      ),
    );
  }
}
