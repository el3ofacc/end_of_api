import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:random_user/main.dart';

class Mylocal_data extends ChangeNotifier {
  List mydata = [];

  Future<void> put_Data(String message) async {
    try {
      if (message.isNotEmpty) {
        await msg!.put('msg_${DateTime.now().microsecondsSinceEpoch}', message);
      }

      Get_data();
    } on Exception catch (e) {}
  }

  Get_data() async {
    mydata = msg!.values.cast<String>().toList();

    notifyListeners();
  }

  deletadata(int index) async {
    var key = msg!.keyAt(index);
  await  msg!.delete(key);
    Get_data();
    notifyListeners();
  }
}
