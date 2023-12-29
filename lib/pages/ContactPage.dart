import 'package:flutter/material.dart';

class Contactpage extends StatefulWidget {
  const Contactpage({super.key});

  @override
  State<Contactpage> createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget> [
          Text ('Contact Page'),
          ElevatedButton(onPressed: () {
              Navigator.popAndPushNamed(context, 'homestack/home');
            }, child: Text('Back to Home page.')),
          ]
        )
      ),
    );
  }
}