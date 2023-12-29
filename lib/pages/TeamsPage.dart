import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Team.dart';
import 'package:flutter_application_1/pages/SMapPage.dart';
import '../models/Team.dart';
import '../widgets/menu.dart';
// ignore: unused_import
import 'dart:convert' as convert;
// ignore: unused_import
import 'package:http/http.dart' as http;

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  List<TeamName>? teamname = [];
  bool isLoading = true;
  Future<void> _getData() async {
    var url = Uri.parse('https://noraphat.dev/web_api/get_team_name/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);
      final Team team =
          Team.fromJson(convert.jsonDecode(response.body));
      setState(() {
        teamname = team.teamname;
        isLoading = false;
      });
    } else {
      print('Error from backed ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text('Teamfootball Page'),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(teamname![index].teamLogo!),
                          fit: BoxFit.cover),
                    ),
                  ),
                  title: Text('${teamname![index].teamName}'),
                  trailing: Icon(Icons.arrow_right_alt),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                              builder:(context) => SMapPage(
                                teamLat: double.parse(teamname![index].teamLat!),
                                teamLong: double.parse(teamname![index].teamLong!),
                                team: teamname![index],
                              )
                              ));
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: teamname!.length),
    );
  }
}
