// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:grocerymart/Ui/Pages/HomeScreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class NotificationPage extends StatefulWidget {
//
//   @override
//   State<NotificationPage> createState() => _NotificationPageState();
// }
//
// class _NotificationPageState extends State<NotificationPage> {
//   var token="loading..";
//   getdata() async
//   {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState((){
//       token = prefs.getString("token")!;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text ("Grocery's Notification"),
//       ),
//       body:  Column(
//         children: [
//           Text(token),
//           Center(
//             child: ElevatedButton(
//                 onPressed: () {
//                   AwesomeNotifications().createNotification(
//                       content: NotificationContent(
//                           id: 123,
//                           channelKey: "basic_channel",
//                           title: "I am from App",
//                           body: "Have a Good Day!"
//                       )
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shape: new RoundedRectangleBorder(
//                     borderRadius: new BorderRadius.circular(30.0),
//                   ),
//                 ),
//
//                 child: Text("Simple Notification")),
//           ),
//           SizedBox(height: 30,),
//           ElevatedButton(
//               onPressed: () async {
//                 bool isallowed = await AwesomeNotifications().isNotificationAllowed();
//                 if (!isallowed) {
//                   //no permission of local notification
//                   AwesomeNotifications().requestPermissionToSendNotifications();
//                 }else{
//                   //show notification
//                   AwesomeNotifications().createNotification(
//                     content: NotificationContent( //with asset image
//                       id: 123,
//                       channelKey: 'basic_channel',
//                       title: 'I am from App',
//                       body: 'Have a Good Day!',
//                       bigPicture: 'https://www.fluttercampus.com/img/logo_small.webp',
//                       notificationLayout: NotificationLayout.BigPicture,
//                       payload: {"name":"fluttercampus"},
//
//                     ),
//                     actionButtons: <NotificationActionButton>[
//                       NotificationActionButton(key: 'Open', label: 'Open',  ),
//                       NotificationActionButton(key: 'Close', label: 'Close'),
//                     ],
//                   );
//                   AwesomeNotifications().actionStream.listen((action) {
//                     if(action.buttonKeyPressed == "Open"){
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => HomeScreen())
//                       );
//                       print("Open button is pressed");
//                     }else if(action.buttonKeyPressed == "Close"){
//                       print("Close button is pressed.");
//                     }
//                   });
//                 }
//               },
//               child: Text("Image Notification")
//           ),
//         ],
//       ),
//     );
//   }
// }
