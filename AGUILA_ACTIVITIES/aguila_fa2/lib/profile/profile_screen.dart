import 'package:aguila_fa2/commons/styled_button.dart';
import 'package:aguila_fa2/models/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:aguila_fa2/commons/styled_text.dart';
import 'package:aguila_fa2/data/profile_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
    this.selectedCategory, {
    super.key,
    required this.onInfoItemSelection,
  });

  final void Function(String infoItem, int numberOfCorrect) onInfoItemSelection;
  final String selectedCategory;

  @override
  State<ProfileScreen> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  var currentInfoIndex = 0;
  var numberOfCorrect = 0;
  String? selectedAnswer;
  bool? isCorrect;
  List<String>? currentChoices;

  void itemClick(String selectedInfoItem, ProfileInfo currentInfo) {
    setState(() {
      selectedAnswer = selectedInfoItem;
      isCorrect = selectedInfoItem == currentInfo.infoCorrectAnswer;
      if(selectedInfoItem == currentInfo.infoCorrectAnswer){
        numberOfCorrect++;
      }
    });

    widget.onInfoItemSelection(selectedInfoItem, numberOfCorrect);

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          currentInfoIndex++;
          selectedAnswer = null;
          isCorrect = null;
          currentChoices = null; 
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ProfileInfo currentInfo = firstData[currentInfoIndex];

    if (widget.selectedCategory == 'Characters of Bikini Bottom') {
      currentInfo = firstData[currentInfoIndex];
    } else if (widget.selectedCategory == 'Episodes & Storylines') {
      currentInfo = secondData[currentInfoIndex];
    } else if (widget.selectedCategory == 'Places & Objects') {
      currentInfo = thirdData[currentInfoIndex];
    }

    currentChoices ??= currentInfo.getShuffledList();

    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
              currentInfo.infoQuestion,
              30,
              const Color.fromARGB(255, 180, 122, 61),
            ),
            const SizedBox(height: 30),
            ...currentChoices!.map((item) {
              Color buttonColor = Colors.white; 

              if (selectedAnswer != null) {
                if (item == currentInfo.infoCorrectAnswer) {
                  buttonColor = Colors.green; 
                } else if (item == selectedAnswer &&
                    item != currentInfo.infoCorrectAnswer) {
                  buttonColor = Colors.red; 
                }
              }

              return StyledButton(
                text: item,
                buttonListener: () {
                  if (selectedAnswer == null) {
                    itemClick(item, currentInfo);
                  }
                },
                color: buttonColor,
              );
            }),
          ],
        ),
      ),
    );
  }
}
