import 'package:flutter/material.dart';

class Catagoryprovider extends ChangeNotifier {
  String field = 'apple';
  changecatagory(String newcatagory) {
    field = newcatagory;
    notifyListeners();
  }
}
