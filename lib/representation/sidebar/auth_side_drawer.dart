import 'package:flutter/material.dart';
import 'package:prgma/representation/authentication/create-new-account.dart';
import 'package:prgma/representation/authentication/login-screen.dart';

class _AuthSideDrawer extends State<AuthSideDrawer> {
  static bool isLoginOrCreate = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
                children: [
                  Expanded(
                    child: isLoginOrCreate ? CreateNewAccount() : LoginScreen(),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLoginOrCreate = !isLoginOrCreate;
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 13),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Text(
                        isLoginOrCreate
                            ? 'Already have an account?'
                            : 'Create New Account',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ));
  }
}

class AuthSideDrawer extends StatefulWidget {
  @override
  _AuthSideDrawer createState() => _AuthSideDrawer();
}
