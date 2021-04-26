import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prgma/representation/Sidebar/auth_side_drawer.dart';

class AuthorizedPage extends StatefulWidget {
  @override
  _AuthorizedPageState createState() => _AuthorizedPageState();
}

class _AuthorizedPageState extends State<AuthorizedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AuthSideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Prgma"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(child:_title() )
      ),
    );
  }
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'P',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'rg',
              style: TextStyle(color: Colors.black, fontSize: 50),
            ),
            TextSpan(
              text: 'ma',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ]),
    );
  }
}
