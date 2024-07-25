import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_user/features/user/data/models/randomuser.dart';
import 'package:random_user/features/user/presentation/widgets/mydialog.dart';

class Api_Service {
  List<Random_user> My_data = [];
  Future<List<Random_user>> Fetch_data(BuildContext context) async {
    try {
      var response =
          await http.get(Uri.parse('https://randomuser.me/api/?results=50'));
 
      var jsonbody = jsonDecode(response.body)['results'] as List;
      My_data = jsonbody.map((json) => Random_user.fromjson(json)).toList();
      return My_data;
    } catch (e) {
      ;   
 
      return Mydialog().showmessage(context, "no internet connection",(){});
    }
  }
}
