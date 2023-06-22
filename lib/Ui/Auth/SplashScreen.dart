import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Utils/Helpers.dart';
import '../Pages/HomeScreen.dart';
import 'LoginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  checkLogin(context) async {
    await Helper.saveUserLogin(true);

    if(Helper.preferences!.containsKey('isLoggedIn')){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> const HomeScreen())
      );
    }
    else
    {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> const LoginPage())
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      checkLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: const Color(0xFFF2FBE8),
        color: const Color(0xFFFBF0E8),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/gro_veg.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                  decoration:  BoxDecoration(
                      borderRadius:  BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 15,
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                        )
                      ]
                  ),
                  child: Image.asset('img/gro_icon.png',width: 40.w,)),
            )
          ],
        ),
      ),
    );
  }
}