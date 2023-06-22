import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Functions/Intro.dart';
import '../Auth/LoginPage.dart';
import 'HomeScreen.dart';
import 'IntroOne.dart';
import 'IntroTwo.dart';

class IntroThree extends StatefulWidget {
  const IntroThree({Key? key}) : super(key: key);

  @override
  State<IntroThree> createState() => _IntroThreeState();
}

class _IntroThreeState extends State<IntroThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: introPage(context: context, bgColor: const Color(0xFFF2FBE8),
    dot:  'img/dots1.png',
    text:  'Online grocery shopping has never been\neasier. Need things fresh? Choose from\nour fresh grocery list now.',
    title:  'Online Grocery Store',
    introImg: 'img/introOneImg.png',
    rectangle: 'img/rectangleImage.png',
    myWidth: 10.w,
    myFontSize: 23,
    text1: '>',
    skip: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoginPage()));
    },
    onClick: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const IntroTwo()));
    }),
    );
  }
}
