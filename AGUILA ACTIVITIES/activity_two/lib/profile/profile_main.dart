import 'package:activity_two/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:activity_two/start_screen.dart';

class ProfileMain extends StatefulWidget{
  const ProfileMain({super.key});

   @override
  State<ProfileMain> createState() {
    return _ProfileMainState();
  }
}

// class _ProfileMainState extends State<ProfileMain>{
//   Widget? activeScreen;

//   @override
//   void initState(){
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }

//   void switchScreen(){
//     setState(() {
//       activeScreen = const ProfileScreen();
//     });
//   }

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors:[ Color.fromARGB(150, 255, 245, 108),Color.fromARGB(255, 174, 173, 13)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               )
//           ),
//           child: activeScreen,
//         )
//       ),
//     );
//   }

// }


class _ProfileMainState extends State<ProfileMain>{

  var activeScreen = 'start-screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'profile-screen';
    });
  }

  @override
  Widget build(BuildContext context){
    Widget currentScreen = StartScreen(switchScreen);

    if (activeScreen == 'profile-screen') {
      currentScreen = ProfileScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[ Color.fromARGB(150, 255, 245, 108),Color.fromARGB(255, 174, 173, 13)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              )
          ),
          child: currentScreen,
        )
      ),
    );
  }

}