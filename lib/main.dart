import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/firebase_options.dart';
import 'package:personal_expense_tracker/screens/Splash_Screen.dart';
import 'package:personal_expense_tracker/screens/Transaction_Screen.dart';
import 'package:personal_expense_tracker/screens/add_transaction_page.dart';
import 'package:personal_expense_tracker/screens/chart_screen.dart';
import 'package:personal_expense_tracker/screens/home_screen.dart';
import 'package:personal_expense_tracker/screens/profile_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
  }

