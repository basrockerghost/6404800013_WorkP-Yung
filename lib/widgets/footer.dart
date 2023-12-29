import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  String footerName = 'ComSci@siamU';
  
  void _changefootername() {
    setState(() {
      footerName='Something kon';
    });
  }

  void initState() {
    super.initState();
    print('This is init state');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$footerName'),
        ElevatedButton(onPressed: _changefootername, child: Text('Press once'))
      ],
    );
  }
}