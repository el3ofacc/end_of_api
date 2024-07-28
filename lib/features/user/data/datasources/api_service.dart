import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_user/features/user/data/models/facebook_news.dart';
import 'package:random_user/features/user/data/models/randomuser.dart';
import 'package:random_user/features/user/presentation/pages/homepage.dart';
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
      return Mydialog().showmessage(
          context: context,
          message: "no internet connection",
          myfun: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          message_option: "retry");
    }
  }
}

class facebook_services {
  List<FacebookNews> facebooklist = [];
  Future<List<FacebookNews>> fetch_facebook_news(BuildContext context,String technology) async {
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=$technology&from=2024-07-27&to=2024-07-27&sortBy=popularity&apiKey=1b18c3db3142420d858568ab22b38ee1"));

      if (response.statusCode == 200) {
        var jsonbody = await jsonDecode(response.body)['articles'] as List;
        facebooklist =
            jsonbody.map((json) => FacebookNews.fromjson(json)).toList();
        return facebooklist;
      } else {
        throw Exception("an error happened");
      }
    } on Exception catch (e) {
      return Mydialog().showmessage(
          context: context,
          message: "no internet connection",
          myfun: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          message_option: "retry");
    }
  }
}
