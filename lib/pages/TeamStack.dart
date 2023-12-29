import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/SMapPage.dart';
import 'package:flutter_application_1/pages/TeamsPage.dart';

class TeamStack extends StatefulWidget {
  TeamStack({super.key});

  @override
  State<TeamStack> createState() => _TeamStackState();
}

class _TeamStackState extends State<TeamStack> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'teamstack/teamname',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'teamstack/teamname':
            builder = (BuildContext context) => TeamsPage();
            break;
          case 'teamstack/s_map':
            builder = (BuildContext context) => SMapPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(builder: builder, settings: settings);
      },
    );
  }
}