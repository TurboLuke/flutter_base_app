import 'package:flutter/material.dart';
import 'package:flutter_base_app/models/category_model.dart';
import 'package:flutter_base_app/models/menu_item_model.dart';
 

class DataProvider extends ChangeNotifier {
  List<CategoryModel> _categories = [];
  List<MenuItemModel> _menuItems = [];
  List<CategoryModel> _nutritions = [];

  List<CategoryModel> get categories => _categories;
  List<MenuItemModel> get menuItems => _menuItems;
  List<CategoryModel> get nutritions => _nutritions;

  void loadData() {
    _categories = CategoryModel.getCategories();
    _menuItems = MenuItemModel.getMenuItems();
    _nutritions = CategoryModel.getNutritions();
    notifyListeners(); // Notify UI to update
  }
}