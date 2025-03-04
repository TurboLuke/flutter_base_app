import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad',
        iconPath: 'assets/icons/salad.svg',
        boxColor: Color(0xff9DCEFF),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Cake',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Color(0xffEEA4CE),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color(0xff9DCEFF),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Smoothies',
        iconPath: 'assets/icons/smoothie.svg',
        boxColor: Color(0xffEEA4CE),
      ),
    );

    return categories;
  }

  static List<CategoryModel> getNutritions() {
    List<CategoryModel> nutritions = [];

    nutritions.add(
      CategoryModel(
        name: '230 Kcal',
        iconPath: 'assets/icons/calories.svg',
        boxColor: Color(0xff9DCEFF),
      ),
    );

    nutritions.add(
      CategoryModel(
        name: '10g Fats',
        iconPath: 'assets/icons/fats.svg',
        boxColor: Color(0xff9DCEFF),
      ),
    );

    nutritions.add(
      CategoryModel(
        name: '20g Proteins',
        iconPath: 'assets/icons/proteins.svg',
        boxColor: Color(0xff9DCEFF),
      ),
    );

    nutritions.add(
      CategoryModel(
        name: '30g Carbs',
        iconPath: 'assets/icons/carbs.svg',
        boxColor:  Color(0xff9DCEFF),
      ),
    );

    return nutritions;
  }
}
