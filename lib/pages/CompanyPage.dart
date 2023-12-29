import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/office.jpg'),
              fit: BoxFit.cover,
            ),
            SafeArea(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hololive company',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text('data'),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: Colors.black,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [Text('Yagoo')],
                          ),
                          Row(
                            children: [Text('098-765-4321')],
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(),
                  Wrapper(),
                  Divider(),
                  builderRowFooter(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Wrap Wrapper() {
    return Wrap(
                    spacing: 8,
                    children: List.generate(
                      3,
                      (index) => Chip(
                        label: Text('Label'),
                        avatar: Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        backgroundColor: Color.fromARGB(255, 166, 194, 216),
                      ),
                    ));
  }

  Row builderRowFooter() {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pompom.jpg'),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.access_alarm),
                          Icon(Icons.accessibility),
                          Icon(Icons.account_balance),
                        ],
                      ),
                    )
                  ],
                );
  }
}
