import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    Map <String, String> Something = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget> [
            Text('About Page'),
            Text('Email ${Something['email']}'),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, 'homestack/contact');
            }, child: Text('Go to Contact page.')),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Back to Home page.')),
          ],
        )
      ),
    );
  }
}