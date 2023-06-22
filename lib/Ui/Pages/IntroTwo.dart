import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../functions/intro.dart';
import '../auth/LoginPage.dart';
import 'IntroThree.dart';

class IntroTwo extends StatefulWidget {
  const IntroTwo({Key? key}) : super(key: key);

  @override
  State<IntroTwo> createState() => _IntroTwoState();
}

class _IntroTwoState extends State<IntroTwo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: introPage(
          context:  context,
          bgColor:  const Color(0xFFE8F2FB),
          introImg:  'img/introTwoImg.png',
          dot: 'img/dots2.png',
          title:  'Choose a Grocery',
          text: 'Get fruits and vegetables or dairy and meat more online at your convenience with Hassle-free Home Delivery options.',
          text1: '>',
          rectangle: 'img/rectangleImage.png',
          myWidth: 10.w,
          myFontSize: 23,
          skip: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginPage()));
          },
          onClick: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const IntroThree()));
          }),
    );
  }
}