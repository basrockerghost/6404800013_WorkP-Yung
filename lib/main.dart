import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/AboutPage.dart';
import 'package:flutter_application_1/pages/ContactPage.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:flutter_application_1/pages/HomeStack.dart';
import 'package:flutter_application_1/pages/LoginPage.dart';
import 'package:flutter_application_1/pages/NewsStack.dart';
import 'package:flutter_application_1/pages/ProductStack.dart';
import 'package:flutter_application_1/pages/TeamStack.dart';
import 'package:flutter_application_1/widgets/footer.dart';
import 'package:flutter_application_1/widgets/logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(  
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 108, 88, 60)),
        useMaterial3: true,
      ),
      //home: const HomePage(title: 'Something คอร์น'),
      initialRoute: '/homestack',
      routes: {
        '/': (context) => LoginPage(),
        '/homestack': (context) => HomeStack(),
        '/productstack': (context) => ProductStack(),
        '/newsstack':(context) => NewsStack(),
        '/teamstack':(context) => TeamStack(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}