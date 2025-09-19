import 'package:activity_two/commons/styled_button.dart';
import 'package:activity_two/models/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:activity_two/commons/styled_text.dart';
import 'package:activity_two/data/profile_data.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState(){
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen>{

  var currentInfoIndex = 0;

  void itemClick(){
    setState(() {
      currentInfoIndex++;
    });
  }

  @override
  Widget build(BuildContext context){
    ProfileInfo currentInfo = profileData[currentInfoIndex];

    return Center(
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(currentInfo.infoDescription, 30, Color.fromARGB(255, 180,122,61)),
            SizedBox(
              height: 30,
            ),
            // StyledButton(text: currentInfo.infoItems[0], buttonListener: (){}),
            // StyledButton(text: currentInfo.infoItems[1], buttonListener: (){}),
            // StyledButton(text: currentInfo.infoItems[2], buttonListener: (){}),
            ...currentInfo.getShuffledList().map((item){
              return StyledButton(text: item, buttonListener: itemClick);
            }),
          ],
        ),
      ),
    );
  }
}