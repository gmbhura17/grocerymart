import 'package:flutter/material.dart';
import '../Ui/Pages/HomeScreen.dart';
import 'constants.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  List<String> appBarTxt = [
    "Home",
    "Account",
    "User",
    "Calls",
  ];
  final bottomList = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  String? uid;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex:  Constants.pageIndex,
        onTap: (index)
        {
          setState(() {
            Constants.pageIndex=index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Theme.of(context).disabledColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile "
          ),
        ],
      ),
      body:  bottomList[Constants.pageIndex],
    );
  }
}