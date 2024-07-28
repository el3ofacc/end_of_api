// import 'package:flutter/material.dart';
// import 'package:random_user/features/user/data/datasources/api_service.dart';
// import 'package:random_user/features/user/data/models/facebook_news.dart';

// class Changelike extends ChangeNotifier {
//   List<bool> islike = [];
//   List<bool> isnotlike = [];
//   List<bool> handsign = [];
//     initalaize(int length) {
//     islike = List.generate(length, (index) => false);
//     isnotlike = List.generate(length, (index) => false);
//     handsign = List.generate(length, (index) => false);
//   }

//   changelikefun(int index) {
//     islike[index] = !islike[index];
//     notifyListeners();
//   }

//   chagngehand(int index) {
//     handsign[index] = !handsign[index];
//     notifyListeners();
//   }

//   changeisisnotlike(int index) {
//     isnotlike[index] = !isnotlike[index];
//     notifyListeners();
//   }
// }


import 'package:flutter/material.dart';

class Changelike extends ChangeNotifier {
  List<bool> islike = [];
  List<bool> isnotlike = [];
  List<bool> handsign = [];

  void initalaize(int length) {
    islike = List.generate(length, (index) => false);
    isnotlike = List.generate(length, (index) => false);
    handsign = List.generate(length, (index) => false);
  }

  void changelikefun(int index) {
    islike[index] = !islike[index];
    notifyListeners();
  }

  void chagngehand(int index) {
    handsign[index] = !handsign[index];
    notifyListeners();
  }

  void changeisisnotlike(int index) {
    isnotlike[index] = !isnotlike[index];
    notifyListeners();
  }
}
