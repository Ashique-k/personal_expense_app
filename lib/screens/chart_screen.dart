import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWithTabs extends StatefulWidget {
  const PieChartWithTabs({super.key});

  @override
  State<PieChartWithTabs> createState() => _PieChartWithTabsState();
}

class _PieChartWithTabsState extends State<PieChartWithTabs>
    with SingleTickerProviderStateMixin {

  String? _dropvalue; // Selected value from dropdown
  final List<String> transactionTypes = ['Day', 'Week', 'Month', 'Year'];

  // Sample data for expenses
  final List<Map<String, dynamic>> _expenses = [
    {"title": "Food", "value": 40, "color": Colors.blue},
    {"title": "Shopping", "value": 30, "color": Colors.red},
    {"title": "Personal", "value": 20, "color": Colors.green},
    {"title": "Entertainment", "value": 10, "color": Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width to adjust radius dynamically
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Breakdown'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for selecting time frame
            Center(
              child: DropdownButton<String>(
                hint: const Text("Select Time Frame"),
                value: _dropvalue,
                items: transactionTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropvalue = newValue;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // Pie Chart Section
            Expanded(
              flex: 2,
              child: PieChart(
                PieChartData(
                  sections: _expenses.map((expense) {
                    return PieChartSectionData(
                      color: expense['color'],
                      value: expense['value'],
                      title: '${expense['value']}%',
                      radius: screenWidth < 600 ? 50 : 80, // Dynamic radius based on screen size
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // List of Expenses with Percentages
            Expanded(
              child: ListView.builder(
                itemCount: _expenses.length,
                itemBuilder: (context, index) {
                  final expense = _expenses[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: expense['color'],
                      child: Text(
                        '${expense['value']}%',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(expense['title']),
                    trailing: Text(
                      '${expense['value']}%',
                      style: TextStyle(
                        color: expense['color'],
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
