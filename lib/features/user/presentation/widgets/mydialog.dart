import 'package:flutter/material.dart';

class Mydialog {
  showmessage(BuildContext context, String message ,Function() myfun) {
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
                    "ok",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ))
            ],
          );
        });
  }
}
