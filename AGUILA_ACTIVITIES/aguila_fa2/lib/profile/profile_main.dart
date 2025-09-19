import 'package:aguila_fa2/category.dart';
import 'package:aguila_fa2/data/profile_data.dart';
import 'package:aguila_fa2/profile/profile_screen.dart';
import 'package:aguila_fa2/profile/profile_summary.dart';
import 'package:flutter/material.dart';
import 'package:aguila_fa2/start_screen.dart';

class ProfileMain extends StatefulWidget {
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

class _ProfileMainState extends State<ProfileMain> {
  String selectedCategory = '';
  final List<String> selectedInfo = [];
  var activeScreen = 'start-screen';
  var flag = 0;
  var correctNum = 0;

  void switchScreen() {
    setState(() {
      selectedInfo.clear();
      activeScreen = 'profile-screen';
    });
  }

  void goToHome() {
    setState(() {
      selectedInfo.clear();
      activeScreen = 'start-screen';
    });
  }

  void switchCategoryScreen() {
    setState(() {
      activeScreen = 'category-screen';
    });
  }

  void addSelectedCategory(String catergoryItem) {
    selectedCategory = catergoryItem;
  }

  void addSelectedInfo(String infoItem, int numberOfCorrect) {
    selectedInfo.add(infoItem);

    if (selectedInfo.length >= firstData.length) {
      setState(() {
        correctNum = numberOfCorrect;
        activeScreen = 'summary-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = StartScreen(switchCategoryScreen);

    if (activeScreen == 'profile-screen') {
      currentScreen = ProfileScreen(
        selectedCategory,
        onInfoItemSelection: addSelectedInfo,
      );
    } else if (activeScreen == 'category-screen') {
      currentScreen = CategoryScreen(
        switchScreen,
        onCategoryItemSelection: addSelectedCategory,
      );
    } else if (activeScreen == 'summary-screen') {
      currentScreen = ProfileSummary(
        correctNum,
        selectedCategory,
        selectedInfo: selectedInfo,
        retakeProfile: switchScreen,
        goToHome: goToHome,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(150, 255, 245, 108),
                Color.fromARGB(255, 174, 173, 13),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
