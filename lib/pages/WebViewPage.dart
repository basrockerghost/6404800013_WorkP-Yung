import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewpage extends StatefulWidget {
  const Webviewpage({super.key});

  @override
  State<Webviewpage> createState() => _WebviewpageState();
}

class _WebviewpageState extends State<Webviewpage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> news = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text('${news['name']}'),
      ),
      body: WebView(
        initialUrl: '${news['url']}',
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}