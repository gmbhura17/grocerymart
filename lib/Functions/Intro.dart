import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

introPage({
  BuildContext? context, Color? bgColor, String? introImg, String? dot, String? title, String? text,VoidCallback? onClick,VoidCallback? skip,String? text1, double? myFontSize, String? rectangle,double? myWidth})

{
  return
    SingleChildScrollView(
      child: Container(
        color: bgColor!,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Opacity(
                    opacity: 0.1,
                    child: Image.asset('img/gro_patt.png',width: 180.w)

                ),
                Positioned(
                  top: 14.h,
                  right: 15.w,
                  child: Image.asset('img/gro_icon_bg.png',width: 180.w),
                ),
              ],
            ),

            SizedBox(height: 20.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 44.3.h,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(
                          MediaQuery.of(context!).size.width, 35.w,
                        )
                    ),
                  ),
                ),

                Positioned(
                  right: 2.w,
                  top: 5.h,
                  left: 4.w,
                  child: Column(
                    children: [
                      Image.asset(dot!,width: 10.w,),
                      SizedBox(height: 5.h,),
                      Text(title!,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w300),),
                      Text(text!, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Color(0xFFC0C0C0)), textAlign: TextAlign.center,),
                      SizedBox(height: 14.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: skip,
                              child: const Text("Skip",style: TextStyle(color: Color(0xFF010101)),)),
                          TextButton(
                            onPressed: onClick,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Image.asset(rectangle!,width: myWidth!),
                                Positioned(
                                    left: 2.5.w,
                                    right: 5.w,
                                    bottom: 1.h,
                                    child:  Center(
                                      child: Text(text1!,style:  TextStyle(color: const Color(0xFFFFFFFF),fontSize: myFontSize!
                                      ),),
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

}
