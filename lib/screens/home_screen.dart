import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/screens/profile_Screen.dart';
import 'Transaction_Screen.dart';
import 'add_transaction_page.dart';
import 'chart_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexNum = 0;

  // List of tabs (pages)
  final List<Widget> tabs = [
    HomeContent(), // Home content widget
    Transpage(), // Transaction page
    PieChartWithTabs(), // Chart page
    ProfilePage(), // Profile page
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTransaction()),
          );
        },
      ),
      appBar: AppBar(
        title: Center(child: Text('EXPENSE TRACKER')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedIconTheme: IconThemeData(
          color: Colors.indigo,
        ),
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Transaction",
            icon: Icon(Icons.compare_arrows),
          ),
          BottomNavigationBarItem(
            label: "Chart",
            icon: Icon(Icons.pie_chart),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
        iconSize: 25,
        currentIndex: _indexNum,
        onTap: (int index) {
          setState(() {
            _indexNum = index; // Update the selected index
          });
        },
      ),
      body: tabs.elementAt(_indexNum), // Display the selected tab
    );
  }
}

// HomeContent Widget to display account balance and recent transactions
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for transactions
    final List<Map<String, String>> transactions = [
      {"title": "Grocery", "amount": "-\$50"},
      {"title": "Salary", "amount": "+\$2500"},
      {"title": "Electricity Bill", "amount": "-\$100"},
      {"title": "Restaurant", "amount": "-\$80"},
    ];

    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Text(
            'Account Balance: \$5000.00',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Income Container
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Income: 25000',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth < 600 ? 12 : 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Expense Container
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Expense: 5000',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth < 600 ? 12 : 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Recent Transactions Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextButton(
                  onPressed: () {
                    // Add your onPressed code here for "View All"
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // ListView for displaying recent transactions
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  leading: Icon(
                    transaction['amount']!.contains('-')
                        ? Icons.remove
                        : Icons.add,
                    color: transaction['amount']!.contains('-')
                        ? Colors.red
                        : Colors.green,
                  ),
                  title: Text(transaction['title']!),
                  trailing: Text(
                    transaction['amount']!,
                    style: TextStyle(
                      color: transaction['amount']!.contains('-')
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
