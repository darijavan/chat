import 'package:flutter/material.dart';
import 'package:mobile/src/constant/styles.dart';
import 'package:mobile/src/util/route.dart';
import 'package:mobile/src/view/screen/signin.dart';
import 'package:mobile/src/view/widget/buttons.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              image: AssetImage(
                'assets/images/header2.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Create\nan account',
                      style: ChatStyles.headerStyle,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      style: ChatStyles.whiteHintStyle,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: ChatStyles.whiteHintStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      style: ChatStyles.whiteHintStyle,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: ChatStyles.whiteHintStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      style: ChatStyles.whiteHintStyle,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: ChatStyles.whiteHintStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Sign up',
                          style: ChatStyles.whiteActionText,
                        ),
                        CircularButton(
                          color: Colors.white,
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 30,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Already have an account? Sign in',
                        style: ChatStyles.whiteTinyActionText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
