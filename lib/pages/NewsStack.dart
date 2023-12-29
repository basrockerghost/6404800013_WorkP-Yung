import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/NewsPage.dart';
import 'package:flutter_application_1/pages/ProductPage.dart';
import 'package:flutter_application_1/pages/WebViewPage.dart';

class NewsStack extends StatefulWidget {
  NewsStack({super.key});

  @override
  State<NewsStack> createState() => _NewsStackState();
}

class _NewsStackState extends State<NewsStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'newsstack/news',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'newsstack/news':
            builder = (BuildContext context) => NewsPage();
            break;
          case 'newsstack/webview':
            builder = (BuildContext context) => Webviewpage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}