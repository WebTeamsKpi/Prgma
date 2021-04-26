import 'package:flutter/material.dart';
import 'package:prgma/representation/pages/authorized_screen.dart';

void main() => runApp(TrelloCloneApp());

class TrelloCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trello Clone',

      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: AuthorizedPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}