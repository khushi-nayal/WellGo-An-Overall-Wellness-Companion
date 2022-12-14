import 'package:flutter/material.dart';
import 'package:meditation_app/models/category.dart';
import 'package:meditation_app/styleguide.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  CategoryWidget({this.category});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategroyId == category.categoryId;

    return GestureDetector(
      onTap: (){
        if(!isSelected){
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.white : Color(0x99ffffff),
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              category.icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
