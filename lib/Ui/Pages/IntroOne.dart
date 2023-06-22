import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../functions/intro.dart';
import '../Auth/LoginPage.dart';
import 'IntroTwo.dart';

class IntroOne extends StatefulWidget {
  const IntroOne({Key? key}) : super(key: key);

  @override
  State<IntroOne> createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          }
      ),
    );
  }
}
//  context: context,
//         onClick: (){
//           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const IntroTwo()));
//         },
//         bgColor:  const Color(0xFFF2FBE8),
//         dot: 'img/dots2.png',
//         text: 'Online grocery shopping has never been\neasier. Need things fresh? Choose from\nour fresh grocery list now.',
//         title: 'Online Grocery Store',


//introPage(context, const Color(0xFFF2FBE8),
//           'img/introOneImg.png',
//           'img/dots2.png',
//           'Online Grocery Store',
//           'Online grocery shopping has never been\neasier. Need things fresh? Choose from\nour fresh grocery list now.'),