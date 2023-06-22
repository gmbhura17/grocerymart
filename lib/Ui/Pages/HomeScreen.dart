import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:grocerymart/Authen/LoginScreen.dart';
import 'package:grocerymart/Ui/Pages/IntroOne.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Functions/HomeContainer.dart';
import '../../Functions/SearchPage.dart';
import '../../Functions/UiBackGround.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            uiBackground(context),
            TextButton(
              onPressed: null,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Image.asset('img/gro_patt.png',width: 400)),
                  Positioned(
                    right: 2.w,
                    child:  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:40.0),
                        child: IconButton(
                          onPressed: (){
                            AlertDialog alert = new AlertDialog(
                              title: Center(child: Text("ALert !")),
                              content: Text("You Want To Logout !"),
                              actions: [
                                Row(
                                  children: [
                                    TextButton(onPressed: (){  Navigator.of(context).pop();}, child: Text("Cancel")),
                                    TextButton(onPressed: (){
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context)=> LoginScreen())
                                      );
                                    }, child: Text("LogOut")),
                                  ],
                                )
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                });
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context)=> NotificationPage()),
                          // );
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> IntroOne()),
                          );
                          },
                          icon:  Image.asset('img/gro_notification.png',width: 100,height: 70,),
                          // alignment: Alignment.topLeft,
                          color: Color(0xFFFE7551),
                          // iconSize: 30.0,
                        ),
                      ),
                        // child: Padding(
                        //   padding: const EdgeInsets.only(top: 38.0,),
                        //   child: Image.asset('img/gro_notification.png',width: 50,height: 7.h,),
                        // )

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 270.0,top: 42),
                    child: IconButton(
                     onPressed: (){
                       showSearch(
                           context: context,
                           delegate: CustomSearchDelegate()
                       );
                     },
                      icon: Icon(Icons.search),
                      // alignment: Alignment.topLeft,
                      color: Color(0xFFFE7551),
                      iconSize: 27.0,
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 50.0),
                  //   child: Align(
                  //       alignment: Alignment.topRight,widthFactor: 11,
                  //       child: Icon(
                  //         Icons.search,
                  //         color: Theme.of(context).primaryColorDark,
                  //         size: 28,
                  //       ),
                  //     actions: [
                  //       IconButton(
                  //         onPressed: () {
                  //           // method to show the search bar
                  //           showSearch(
                  //               context: context,
                  //               // delegate to customize the search bar
                  //               delegate: CustomSearchDelegate()
                  //           );
                  //         },
                  //         icon: const Icon(Icons.search),
                  //       )
                  //     ],
                  //   ),
                  // ),

                  Positioned(
                    left: 1.w,
                    top: 8.4.h,
                    child: Text('Baharpura Times, Gulam Bhura',style: TextStyle(color: Theme.of(context).backgroundColor).copyWith(color:
                    const Color(0x6B645F5F),fontSize: 10),),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        SizedBox(height: 13.h),
                        Icon(Icons.shopping_cart,color: Theme.of(context).primaryColorDark,),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text('Work',style: TextStyle(color: Theme.of(context).backgroundColor),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Icon(Icons.keyboard_arrow_down_outlined,color: Theme.of(context).backgroundColor,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 10.h,
                    width: size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 11.h),
                        Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: ImageSlideshow(
                            height: 25.h,
                            indicatorColor: Colors.orange,
                            onPageChanged: (value) {
                              debugPrint('Page changed: $value');
                            },
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: [
                              Image.asset('img/gro_banner.png'),
                              Image.asset('img/gro_banner4',),
                              Image.asset('img/gro_banner5',),
                              Image.asset('img/gro_banner5',),
                              Image.asset('img/gro_banner4',),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Shop By Categories",style: TextStyle(color: Colors.black,fontSize: 15,)),
                            Text("View All",style: TextStyle(fontSize: 10)),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  homeScreenContainer(const Color(0xFFE2F5FF), "img/gro_strabery.png",'Vegetables'),
                                  homeScreenContainer(const Color(0xFFFFEBE6), 'img/gro_fru.png','Fruits'),
                                  homeScreenContainer(const Color(0xFFFFF4D8), 'img/gro_bak.png','Bakery'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  homeScreenContainer(const Color(0xFFF9EEFF), 'img/gro_att.png','Atta & maida'),
                                  homeScreenContainer(const Color(0xFFEDEFFF), 'img/gro_bav.png','Beverages'),
                                  homeScreenContainer(const Color(0xFFE3F8E0), 'img/gro_sna.png','Snacks'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  homeScreenContainer(const Color(0xFFE2F5FF), 'img/gro_bab.png','Baby Care'),
                                  homeScreenContainer(const Color(0xFFFFEBE6), 'img/gro_per.png','Personal Care'),
                                  homeScreenContainer(const Color(0xFFFFF4D8), 'img/gro_hou.png','House Cleaning'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('img/gro_bon.png'),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Fruits & Vegetables",style: TextStyle(color: Colors.black,fontSize: 15,)),
                              Text("View All",style: TextStyle(fontSize: 10)),
                            ],

                          ),
                        ),
                      ],
                    ),
                  ),

                  Stack(
                    children: [
                      SizedBox(
                        height: 270.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            homeScreenListContainer(context,'img/gro_strabery.png','₹125','₹200','Freshly packed ','1 Kg'),
                            homeScreenListContainer(context,'img/gro_cory.png','₹75','₹100','Fresh Organic Coriander Leaves','1 Kg'),
                            homeScreenListContainer(context,'img/gro_att.png','₹1175','1375','   atta with extra cottage ','2 Kg'),
                            homeScreenListContainer(context,'img/gro_bak.png','999','₹1100','Bakery','2 Kg'),
                            homeScreenListContainer(context,'img/gro_bab.png','999','₹1100','Baby Care','2 Kg'),
                            homeScreenListContainer(context,'img/gro_sna.png','999','₹1100','Snakes','2 Kg'),
                            homeScreenListContainer(context,'img/gro_bav.png','999','₹1100','Beverages','2 Kg'),
                            homeScreenListContainer(context,'img/gro_straberry.png','999','₹1100','Straberry','2 Kg'),
                            homeScreenListContainer(context,'img/gro_per.png','999','₹1100','Personal Care','2 Kg'),
                            homeScreenListContainer(context,'img/gro_hou.png','999','₹1100','House Cleaning','2 Kg'),
                            Container(
                              height: 40.3.h,
                              decoration:  BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.elliptical(
                                      MediaQuery.of(context!).size.width, 35.w,
                                    ),
                                ),
                              ),
                              // Icon(Icons.shopping_cart,color: Theme.of(context).primaryColorDark,),
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
      ),
    );
  }
}