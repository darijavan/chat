import 'package:flutter/material.dart';
import 'package:mobile/src/constant/styles.dart';
import 'package:mobile/src/util/route.dart';
import 'package:mobile/src/view/screen/signup.dart';
import 'package:mobile/src/view/widget/buttons.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage(
                  'assets/images/header1.png',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(
                  width: 50,
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  'Welcome\nto Chat',
                  style: ChatStyles.headerStyle,
                ),
                SizedBox(
                  height: 60,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: ChatStyles.hintStyle,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: ChatStyles.hintStyle,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Sign in',
                      style: ChatStyles.actionText,
                    ),
                    CircularButton(
                      color: Colors.black87,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () => RouteUtils.goTo(
                        context: context,
                        child: SignupScreen(),
                      ),
                      child: Text(
                        'Sign up',
                        style: ChatStyles.tinyActionText,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot password?',
                        style: ChatStyles.tinyActionText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
