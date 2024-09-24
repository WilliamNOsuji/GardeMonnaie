import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  final double totalBudget;
  final double totalExpenses;
  final List<Map<String, dynamic>> recentTransactions;

  OverviewPage({
    required this.totalBudget,
    required this.totalExpenses,
    required this.recentTransactions,
  });

  @override
  Widget build(BuildContext context) {
    double remainingBudget = totalBudget - totalExpenses;

    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Overview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Budget summary section
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Budget: \$${totalBudget.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total Expenses: \$${totalExpenses.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Remaining Budget: \$${remainingBudget.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: remainingBudget < 0 ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Recent Transactions header
            Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Recent Transactions List
            Expanded(
              child: ListView.builder(
                itemCount: recentTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = recentTransactions[index];
                  return ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(transaction['description']),
                    subtitle: Text(transaction['date']),
                    trailing: Text(
                      '\$${transaction['amount'].toStringAsFixed(2)}',
                      style: TextStyle(
                        color: transaction['amount'] < 0 ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}