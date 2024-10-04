import 'package:flutter/material.dart';

class Transpage extends StatefulWidget {
  const Transpage({super.key});

  @override
  State<Transpage> createState() => _TranspageState();
}

class _TranspageState extends State<Transpage> {
  // Sample transaction data
  final List<Map<String, dynamic>> _transactions = [
    {
      "title": "Grocery",
      "amount": "-\$50",
      "date": "02 Oct 2024",
      "type": "Expense"
    },
    {
      "title": "Salary",
      "amount": "+\$2500",
      "date": "01 Oct 2024",
      "type": "Income"
    },
    {
      "title": "Electricity Bill",
      "amount": "-\$100",
      "date": "30 Sep 2024",
      "type": "Expense"
    },
    {
      "title": "Restaurant",
      "amount": "-\$80",
      "date": "28 Sep 2024",
      "type": "Expense"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _transactions.length, // Number of transactions
          itemBuilder: (context, index) {
            final transaction = _transactions[index];

            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8.0), // Margin between cards
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners for the card
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: transaction['amount'].contains('-') ? Colors.red : Colors.green,
                  child: Icon(
                    transaction['amount'].contains('-') ? Icons.remove : Icons.add,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  transaction['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(transaction['date']), // Show the date of the transaction
                trailing: Text(
                  transaction['amount'],
                  style: TextStyle(
                    color: transaction['amount'].contains('-') ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
