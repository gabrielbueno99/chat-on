import 'package:chaton/helper/helper_functions.dart';
import 'package:chaton/pages/auth/login_page.dart';
import 'package:chaton/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) => {
          if (value != null) {_isSignedIn = value}
        });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Color.fromARGB(255, 4, 36, 90),
            scaffoldBackgroundColor: Colors.white),
        home: _isSignedIn ? const HomePage() : const LoginPage());
  }
}
