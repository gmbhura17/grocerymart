import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

homeScreenContainer(Color? myColor,String? myImage,String? productName){
  return
    Column(
      children: [
        GestureDetector(
          onTap: (){

          },
          child: Container(
            width: 29.w,
            height: 13.h,
            decoration:  BoxDecoration(
                color: myColor,
                borderRadius: const BorderRadius.all(Radius.circular(12))
            ),
            child: Image.asset("img/gro_intro_img3.png"),
          ),
        ),
        Text(productName!,style: const TextStyle(fontSize: 13,color: Colors.black),),
      ],
    );
}
homeScreenListContainer(BuildContext context, String? myImage,String? newPText,String? oldPText,String? text1,String? text2,){
  return
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
              width: 35.w,
              height: 27.h,
              decoration:  const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 2.h,),
                        Image.asset(myImage!),
                        SizedBox(height: 2.h,),
                        Text(text1!,style:  TextStyle(fontSize: 13,color: Colors.black),),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(text2!,style:  TextStyle(fontSize: 9,),)
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children:  [
                                Text(newPText!,style:  const TextStyle(fontSize: 13,color: Colors.black),),
                                SizedBox(height: 4.h,),
                                Text(oldPText!,style:  const TextStyle(fontSize: 9,decoration: TextDecoration.lineThrough),),
                              ],
                            )),
                      ],
                    ),
                  )
              )
          ),
        ],
      ),
    );
}
