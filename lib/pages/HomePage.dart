import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/logo.dart';
import 'package:flutter_application_1/widgets/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('test flutter'),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/japan.jpg"),
                  fit: BoxFit.cover)),
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/company', arguments: {
                    'Email': 'basrockerghost@gmail.com',
                    'telephone': '098-365-5698',
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business,
                        size: 80,
                        color: Colors.cyan,
                      ),
                      Text(
                        'Company',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/map', );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map,
                        size: 80,
                        color: Colors.cyan,
                      ),
                      Text(
                        'Google Map เอง',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/camera', );
                }
                ,child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera, size: 80, color: Colors.cyan),
                      Text(
                        'Camera เอง',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'homestack/about', arguments: {
                    'Email': 'basrockerghost@gmail.com',
                    'telephone': '098-365-5698',
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.cyan,
                      ),
                      Text(
                        'About me เอง',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
