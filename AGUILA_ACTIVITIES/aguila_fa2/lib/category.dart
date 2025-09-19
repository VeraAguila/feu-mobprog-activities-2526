import 'package:aguila_fa2/commons/styled_button.dart';
import 'package:aguila_fa2/models/profile_category.dart';
import 'package:flutter/material.dart';
import 'package:aguila_fa2/commons/styled_text.dart';
import 'package:aguila_fa2/data/profile_category_data.dart';

class CategoryScreen extends StatefulWidget{
  const CategoryScreen(this.switchScreen, {super.key, required this.onCategoryItemSelection});

  final void Function(String categoryItem) onCategoryItemSelection;

  final void Function() switchScreen;

  @override
  State<CategoryScreen> createState(){
    return _CategoryScreenState();
  }
}

class _CategoryScreenState extends State<CategoryScreen>{

  var currentInfoIndex = 0;
  var categoryChoice = 0;

  void itemClick(String selectedCategoryItem){
    widget.onCategoryItemSelection(selectedCategoryItem);

    widget.switchScreen();
  }

  @override
  Widget build(BuildContext context){
    ProfileCategory currentInfo = categoryData[currentInfoIndex];

    return Center(
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(currentInfo.categoryDescription, 30, Color.fromARGB(255, 180,122,61)),
            SizedBox(
              height: 30,
            ),
            // StyledButton(text: currentInfo.infoItems[0], buttonListener: (){}),
            // StyledButton(text: currentInfo.infoItems[1], buttonListener: (){}),
            // StyledButton(text: currentInfo.infoItems[2], buttonListener: (){}),
            ...currentInfo.getShuffledList().map((item){
              return StyledButton(text: item, buttonListener: (){
                itemClick(item);
              });
            }),
          ],
        ),
      ),
    );
  }
}