import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController datectrl = TextEditingController();

  String? dropdownValue;
  String? _dropvalue; // Rename for clarity
  final List<String> transactionTypes = ['Shopping', 'Food', 'Medical', 'Film'];
  final List<String> _description = [
    'buy some grocery',
    'Street arabia',
    'checkup',
    'calicut'
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Check if the screen is small (mobile) or large (tablet/web)
    bool isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ADD TRANSACTION"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const Text(
              "How much?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            const SizedBox(height: 5),
            const Text(
              "\$5000.00", // Amount can be dynamic if needed
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Card for Dropdown
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<String>(
                  hint: const Text('Select Category'),
                  value: dropdownValue,
                  isExpanded: true,
                  items: transactionTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Card for Description Dropdown
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<String>(
                  hint: const Text('Description'),
                  value: _dropvalue,
                  isExpanded: true,
                  items: _description.map((String desc) {
                    return DropdownMenuItem<String>(
                      value: desc,
                      child: Text(desc),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropvalue = newValue;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Income/Expense Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: isSmallScreen ? 30 : 40,
                  width: isSmallScreen ? 80 : 100,
                  color: Colors.green,
                  child: const Center(child: Text("Income")),
                ),
                const SizedBox(width: 5),
                Container(
                  height: isSmallScreen ? 30 : 40,
                  width: isSmallScreen ? 80 : 100,
                  color: Colors.red,
                  child: const Center(child: Text("Expense")),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Date Picker
            TextFormField(
              controller: datectrl,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Pick Your Date",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final DateTime? _date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                    if (_date != null) {
                      final formattedDate = DateFormat("dd/MM/yyyy").format(_date);
                      setState(() {
                        datectrl.text = formattedDate;
                      });
                    }
                  },
                  icon: const Icon(Icons.calendar_month),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Continue Button
            SizedBox(
              height: isSmallScreen ? 45 : 55,
              width: screenWidth * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CupertinoColors.systemPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
