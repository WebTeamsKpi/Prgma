import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prgma/constant/pallete.dart';
import 'package:prgma/models/User.dart';
import 'package:prgma/representation/pages/home_page.dart';
import 'package:prgma/representation/widgets/password-input.dart';
import 'package:prgma/representation/widgets/text-field-input.dart';
import 'package:prgma/router.dart';

class CreateNewAccount extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.blue,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.05,
                            backgroundColor: Colors.grey[400].withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              Icons.people,
                              color: kWhite,
                              size: size.width * 0.03,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Column(
                  children: [
                    TextInputField(
                      icon: Icons.people,
                      hint: 'User',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                      controller: name,
                    ),
                    PasswordInput(
                      icon: Icons.password,
                      hint: 'Password',
                      inputAction: TextInputAction.next,
                      controller: password,
                    ),
                    PasswordInput(
                      icon: Icons.password,
                      hint: 'Confirm Password',
                      inputAction: TextInputAction.done,
                      controller: confirmPassword,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kBlue,
                      ),
                      child: FlatButton(
                        onPressed: () async {
                          if (password.text == confirmPassword.text) {
                            User user = new User(
                                name: name.text, password: password.text);
                            HomePage.user = await RouterOfHttp.createUser(user);
                            if (HomePage.user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            }
                          }
                        },
                        child: Text(
                          "Register",
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
