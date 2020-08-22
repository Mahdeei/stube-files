import 'package:flutter/material.dart';
import 'package:stubbbb/ValidatePhonenumber.dart';

import 'Component/textformfield.dart';
import 'R.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKeyLog = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var phonesize = MediaQuery.of(context).size;
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Directionality(
            textDirection: TextDirection.rtl,
            child: new SafeArea(
                top: true,
                child: new Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: new Stack(children: <Widget>[
                      new Container(
                        height: phonesize.height,
                        // width: phonesize.width,
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/image/backlog.png',
                                ))),
                      ),
                      new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        height: phonesize.height,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40))),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new SizedBox(
                              height: phonesize.height * 0.19,
                            ),
                            new Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: new Text('منتظرت بودیم !',
                                    style: TextStyle(
                                        fontSize: 35.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                            new SizedBox(
                              height: phonesize.height * 0.20,
                            ),
                            new Form(
                              key: _formKeyLog,
                              child: new Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: new Column(
                                    children: <Widget>[
                                      InputTextForm(
                                        // hint: 'نام کاربری',
                                        lableColor: Colors.grey,
                                        color: Colors.grey,
                                        textColor: Colors.grey,
                                        lable: 'نام کاربری',
                                        // iconData: Icons.school,
                                        obscure: false,
                                      ),
                                      InputTextForm(
                                        // hint: 'کلمه عبور',
                                        lableColor: Colors.grey,
                                        color: Colors.grey,
                                        textColor: Colors.grey,
                                        lable: 'کلمه عبور',
                                        // iconData: Icons.lock,
                                        obscure: true,
                                      ),
                                    ],
                                  )),
                            ),
                            new SizedBox(
                              height: phonesize.height * 0.09,
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Padding(
                                  padding: const EdgeInsets.only(
                                      right: 35, bottom: 10),
                                  child: new Text(
                                    'ورود',
                                    style: new TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: new CircleAvatar(
                                    radius: 40,
                                    backgroundColor: R.color.banafshmain,
                                    child: new Icon(
                                      Icons.arrow_forward,
                                      size: 40,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            new SizedBox(
                              height: phonesize.height * 0.05,
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                new GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                new ValidatePhoneNumber()));
                                  },
                                  child: new Text(
                                    'ثبت نام',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 17),
                                  ),
                                ),
                                new GestureDetector(
                                  onTap: () {
                                    print('pressed1');
                                  },
                                  child: new Text(
                                    'فراموشی گلمه عبور',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 17),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ])))));
  }
}
