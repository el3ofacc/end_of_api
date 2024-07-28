import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:random_user/features/user/presentation/pages/detailsscreen.dart';

import 'package:random_user/features/user/presentation/widgets/messagebody.dart';
import 'package:random_user/features/user/presentation/widgets/myimage.dart';

import 'package:random_user/features/user/presentation/widgets/mytextform.dart';

class Message_screen extends StatefulWidget {
  Message_screen({super.key,required this.image,required   this.name   });
  String ?image;
  String? name;
  @override
  State<Message_screen> createState() => _Message_screenState();
}

class _Message_screenState extends State<Message_screen> {
  TextEditingController messagecontroller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name!,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Details_screen(image: widget.image!,
                   name:widget.name!)));
            },
            child: myimage(image: widget.image!)),
      ),
      body: Column(
        children: [
          Divider(),
          Message_body(),
          mytextform(),
        ],
      ),
    );
  }
}
