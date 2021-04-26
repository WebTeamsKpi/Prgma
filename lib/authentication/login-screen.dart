import 'package:flutter/material.dart';
import 'package:prgma/constant/pallete.dart';
import 'package:prgma/representation/pages/home_page.dart';
import 'package:prgma/representation/widgets/password-input.dart';
import 'package:prgma/representation/widgets/text-field-input.dart';
import 'package:prgma/router.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.blue,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Prgma',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    icon: Icons.email,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    controller: name,
                  ),
                  PasswordInput(
                    icon: Icons.password,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                    controller: password,
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
                        HomePage.user  = await RouterOfHttp.getUsers(
                            name.text, password.text);
                        if (  HomePage.user  != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      },
                      child: Text(
                        "Login",
                        style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
