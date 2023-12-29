import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          //   child: Text(
          //     'Drawer Header',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24,
          //     ),
          //   ),
          // ),
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(Icons.shopping_basket),
            accountName: Text('Something Kon'),
            accountEmail: Text('SomethingKon@gmail.com'),
            otherAccountsPictures: [
              Icon(Icons.bookmark_border),
            ],
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/startend.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            trailing: Icon(Icons.arrow_right_alt),
            selected: ModalRoute.of(context)?.settings.name == 'homestack/home'
                ? true
                : false,
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/homestack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Product'),
            trailing: Icon(Icons.arrow_right_alt),
            selected:
                ModalRoute.of(context)?.settings.name == 'productstack/product'
                    ? true
                    : false,
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/productstack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('News'),
            trailing: Icon(Icons.arrow_right_alt),
            selected:
                ModalRoute.of(context)?.settings.name == 'newsstack/news'
                    ? true
                    : false,
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/newsstack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.sports_football),
            title: Text('Team Football'),
            trailing: Icon(Icons.arrow_right_alt),
            selected:
                ModalRoute.of(context)?.settings.name == 'teamstack/teamname'
                    ? true
                    : false,
            onTap: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/teamstack', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
