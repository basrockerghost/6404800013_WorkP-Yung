// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class TeamViewPage extends StatefulWidget {
//   const TeamViewPage({super.key});

//   @override
//   State<TeamViewPage> createState() => _TeamViewPageState();
// }

// class _TeamViewPageState extends State<TeamViewPage> {
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> team = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${team['teamName']}'),
//       ),
//       body: WebView(
//         initialUrl: '${team['teamDetail']}',
//         javascriptMode: JavascriptMode.unrestricted,
//       )
//     );
//   }
// }