import 'package:flutter/material.dart';

class Mydialog {
  showmessage({ required BuildContext context,
  required String message ,
required  Function() myfun,
required
String message_option}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    myfun();
                  },
                  child: Text(
                    message_option,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ))
            ],
          );
        });
  }
}
