import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerymart/Authen/SplashS.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Ui/Auth/LoginPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  //
  // await FirebaseMessaging.instance.getToken().then((token) async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("token", token!);
  // });
  //
  // //
  // void showFlutterNotification(RemoteMessage message) {
  //   RemoteNotification? notification = message.notification;
  //   AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: 123,
  //           channelKey: "basic_channel",
  //           title: notification!.title.toString(),
  //           body: notification.body.toString()
  //       )
  //   );
  // }
  // FirebaseMessaging.onMessage.listen(showFlutterNotification);
  // //
  //
  //
  // AwesomeNotifications().initialize(
  //     'resource://drawable/launch_background',
  //     [
  //       NotificationChannel(
  //         channelGroupKey: 'basic_tests',
  //         channelKey: 'basic_channel',
  //         channelName: 'Basic notifications',
  //         channelDescription: 'Notification channel for basic tests',
  //         defaultColor: Color(0xFF9D50DD),
  //         ledColor: Colors.white,
  //         importance: NotificationImportance.High,
  //         enableVibration: true,
  //       ),
  //       NotificationChannel(
  //           channelGroupKey: 'basic_tests',
  //           channelKey: 'basic_channel',
  //           channelName: 'Basic notifications',
  //           channelDescription: 'Notification channel for image tests',
  //           defaultColor: Colors.redAccent,
  //           ledColor: Colors.white,
  //           channelShowBadge: true,
  //           importance: NotificationImportance.High
  //       )
  //     ],
  //     channelGroups: [
  //       NotificationChannelGroup(channelGroupkey: 'basic_tests', channelGroupName: 'Basic tests'),
  //     ],
  //     debug: true
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const type = 1;
  @override
  Widget build(BuildContext context) {
    return  ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GestureDetector(
          onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.purple,
              primaryColor: const Color(0xFFFFFFFF),
              canvasColor: const Color(0xFFFBFAFF),
              primaryColorDark: const Color(0xFFFE7551),
              backgroundColor: const Color(0xFF111111),
              fontFamily: GoogleFonts.poppins().fontFamily,
              textTheme: const TextTheme(
                headline1: TextStyle(),
                headline2: TextStyle(),
                headline3: TextStyle(),
                headline4: TextStyle(),
                headline5: TextStyle(),
                headline6: TextStyle(),
                subtitle1: TextStyle(),
                subtitle2: TextStyle(),
                bodyText1: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                bodyText2: TextStyle(),
                button: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18,fontWeight: FontWeight.bold),
                caption: TextStyle(),
                overline: TextStyle(),
              ),
            ),
            home: SplashS(),
            // home:   const RoughPage(),
          ),
        );
      },
      maxTabletWidth: 900, // Optional
    );
  }
}

//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
