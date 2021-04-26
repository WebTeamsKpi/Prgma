import 'package:flutter/material.dart';
import 'package:prgma/representation/pages/home_page.dart';

class _HomeSideDrawer extends State<HomeSideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        DrawerHeader(
          child: Center(
              child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Text(HomePage.user.name),
          )),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Name:' + HomePage.user.name),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () => {},
        ),
     
        ListTile(
          leading: Icon(Icons.border_color),
          title: Text('Feedback'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
          onTap: () => {Navigator.of(context).pop()},
        ),
      ],
    ));
  }
}

class HomeSideDrawer extends StatefulWidget {
  @override
  _HomeSideDrawer createState() => _HomeSideDrawer();
}
