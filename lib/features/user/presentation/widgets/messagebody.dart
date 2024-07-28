import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/features/user/presentation/provider/mylocaldata.dart';
import 'package:random_user/features/user/presentation/widgets/mydialog.dart';
import 'package:random_user/main.dart';

class Message_body extends StatefulWidget {
  const Message_body({super.key});

  @override
  State<Message_body> createState() => _Message_bodyState();
}

class _Message_bodyState extends State<Message_body> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Mylocal_data>(context, listen: false).Get_data();
    });
  }

  Widget build(BuildContext context) {
    return Consumer<Mylocal_data>(
      builder: (context, provdier, child) {
        return Expanded(
          child: ListView.builder(
              itemCount: provdier.mydata.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onLongPress: () {
                      Mydialog().showmessage(context:context, 
                      message:"${provdier.mydata[index]} will be deleted",
                        myfun:  () {
                        provdier.deletadata(index);
                      },message_option: "ok");
                    },
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            provdier.mydata[index].toString(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
