import 'package:aguila_fa2/commons/styled_button.dart';
import 'package:aguila_fa2/commons/styled_text.dart';
import 'package:aguila_fa2/data/profile_data.dart';
import 'package:aguila_fa2/profile/profile_summary_item.dart';
import 'package:flutter/material.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary(
    this.correctNum,
    this.selectedCategory, {
    super.key,
    required this.selectedInfo,
    required this.retakeProfile,
    required this.goToHome,
  });

  final int correctNum;
  final String selectedCategory;
  final List<String> selectedInfo;
  final void Function() retakeProfile;
  final void Function() goToHome;

  String getInfoDescription(int i) {
  if (selectedCategory == 'Characters of Bikini Bottom') {
    return firstData[i].infoQuestion;
  } else if (selectedCategory == 'Episodes & Storylines') {
    return secondData[i].infoQuestion;
  } else {
    return thirdData[i].infoQuestion;
  }
}

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedInfo.length; i++) {
      summary.add({
        'info_index': i + 1,
        'info_description': getInfoDescription(i),
        'selected_info_item': selectedInfo[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText('Spongebob Squarepants', 30, Colors.white),
            StyledText('Score: $correctNum', 15, Colors.white),
            Expanded(child: ProfileSummaryItem(getSummaryData())),
            StyledButton(
              text: 'Retake Quiz',
              buttonListener: retakeProfile,
            ),
            StyledButton(
              text: 'Home',
              buttonListener: goToHome,
            ),
          ],
        ),
      ),
    );
  }
}
