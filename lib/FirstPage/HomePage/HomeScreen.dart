import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:stubbbb/FirstPage/MessagePage/MessagePage.dart';
import 'package:stubbbb/FirstPage/RequestPage/RequestPage.dart';
import 'package:stubbbb/Models/Profile.dart';
import '../../Other/R.dart';
import 'HomePage.dart';



class HomePage extends StatefulWidget {

  Profile profile;
  HomePage({this.profile});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  Profile profile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      profile = widget.profile;
      // print(profile.username);
    });
  }

  Map data ;
  int currentindex = 1;
  List listwidget = [
    MyRequestPage(),
    MyHomePage(),
    MyMessagePage(),
  ];

  changePage(int indexpage) {
    setState(() {
      currentindex = indexpage;
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBackgroundColor: R.color.red,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: R.color.banafshtire,
        ),
        selectedIndex: currentindex,
        onSelectTab: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.mail,
            label: 'جعبه',
          ),
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'خانه',
          ),
          FFNavigationBarItem(
            iconData: Icons.chat,
            label: 'پیام ها',
          ),
        ],
      ),
      body: currentindex==1
          ? MyHomePage(profile: profile,)
          : currentindex==0
            ? MyRequestPage(profile: this.profile,)
            : MyMessagePage()

      ,
    );
  }






}




