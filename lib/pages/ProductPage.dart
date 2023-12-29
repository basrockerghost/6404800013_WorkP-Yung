import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../widgets/menu.dart';
// ignore: unused_import
import 'dart:convert' as convert;
// ignore: unused_import
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Course>? course = [];
  bool isLoading = true;
  Future<void> _getData() async {
    var url = Uri.parse('https://noraphat.dev/ComSciSiamU/SomethingCorn/get_product/');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body);
      final Product product =
          Product.fromJson(convert.jsonDecode(response.body));
      setState(() {
        course = product.course;
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
        title: Text('Product Page'),
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
                          image: NetworkImage(course![index].images!),
                          fit: BoxFit.cover),
                    ),
                  ),
                  title: Text('${course![index].pdName}'),
                  subtitle: Text('Price : ${course![index].price} .-'),
                  trailing: Icon(Icons.arrow_right_alt),
                  onTap: () {
                    Navigator.pushNamed(context, 'productstack/detail');
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: course!.length),
    );
  }
}
