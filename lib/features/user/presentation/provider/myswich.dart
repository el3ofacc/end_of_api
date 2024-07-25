import 'package:flutter/material.dart';

class Myswich_provider extends ChangeNotifier {
  bool oldvalue=false;
  change_swich(bool newvalue) {
    oldvalue = newvalue;
    notifyListeners();
  }
}
