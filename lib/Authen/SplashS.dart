import 'package:flutter/material.dart';
import 'package:grocerymart/Authen/LoginScreen.dart';
import 'package:grocerymart/Ui/Pages/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashS extends StatefulWidget {

  @override
  State<SplashS> createState() => _SplashSState();
}

class _SplashSState extends State<SplashS> {

  checkdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>HomeScreen())
      );
    }
    else
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>LoginScreen())
      );
    }
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      checkdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("img/gro_icon.png",width: 200),
    );
  }
}
