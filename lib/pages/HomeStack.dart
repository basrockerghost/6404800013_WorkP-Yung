import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/AboutPage.dart';
import 'package:flutter_application_1/pages/CameraPage.dart';
import 'package:flutter_application_1/pages/CompanyPage.dart';
import 'package:flutter_application_1/pages/ContactPage.dart';
import 'package:flutter_application_1/pages/HomePage.dart';
import 'package:flutter_application_1/pages/MapPage.dart';
import 'package:flutter_application_1/pages/PicturePage.dart';

class HomeStack extends StatefulWidget {
  const HomeStack({super.key});

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'homestack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'homestack/home':
            builder = (BuildContext context) => HomePage();
            break;
          case 'homestack/about':
            builder = (BuildContext context) => AboutPage();
            break;
          case 'homestack/contact':
            builder = (BuildContext context) => Contactpage();
            break;
          case 'homestack/company':
            builder = (BuildContext context) => CompanyPage();
            break;
          case 'homestack/camera':
            builder = (BuildContext context) => Camerapage();
            break;
          case 'homestack/picture':
            builder = (BuildContext context) => Picturepage();
            break;
          case 'homestack/map':
            builder = (BuildContext context) => Mappage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}