import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/menu.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic>? article = [];
  int totalResult = 0;
  bool isLoading = true;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int page = 1;
  int pageSize = 5;

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      article!.clear();
      page = 1;
    });
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) {
      setState(() {
        page = ++page;
      });
      _getData();
    }
    _refreshController;
  }

  Future<void> _getData() async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=jp&apiKey=e47f8d299eb54a0ab484171540e07ef0&page=$page&pageSize=$pageSize');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // print(response.body);
        final Map<String, dynamic> news = convert.jsonDecode(response.body);
        print('total result : ${news['totalResults']}');
        setState(() {
          totalResult = news['totalResults'];
          article!.addAll(news['articles']);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Error from backed ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
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
          title: totalResult > 0 ? Text('News $totalResult Topics') : null,
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: ClassicHeader(
                  refreshStyle: RefreshStyle.Follow,
                  refreshingText: 'Now Loading',
                  completeText: 'Success Loading',
                ),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("pull up load");
                    } else if (mode == LoadStatus.loading) {
                      body = CircularProgressIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("release to load more");
                    } else {
                      body = Text("No more Data");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'homestack/about',
                              arguments: {
                                'url': article![index]['url'],
                                'name': article![index]['source']['name'],
                                'title': article![index]['title']
                              });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: article![index]['urlToImage'] != null
                                        ? Ink.image(
                                            image: NetworkImage(
                                                article![index]['urlToImage']),
                                            fit: BoxFit.cover)
                                        : Ink.image(
                                            image: NetworkImage(''),
                                            fit: BoxFit.cover),
                                  ),
                                  Positioned(
                                      top: 16,
                                      bottom: 16,
                                      left: 16,
                                      right: 16,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          article![index]['source']['name'],
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(article![index]['title']),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        article![index]['author'] != null
                                            ? Chip(
                                                avatar: Icon(Icons.person_pin),
                                                label: article![index]['author']
                                                            .length <
                                                        20
                                                    ? Text(article![index]
                                                        ['author'])
                                                    : Text(article![index]
                                                            ['author']
                                                        .substring(0, 20)),
                                              )
                                            : Text(''),
                                        Text(DateFormat.yMMMEd()
                                            .add_Hms()
                                            .format(DateTime.parse(
                                                article![index]
                                                    ['publishedAt'])))
                                      ])
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: article!.length),
              ));
  }
}
