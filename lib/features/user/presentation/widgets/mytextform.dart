import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'package:random_user/features/user/presentation/provider/mylocaldata.dart';

class mytextform extends StatefulWidget {
  const mytextform({
    super.key,
  });

  @override
  State<mytextform> createState() => _mytextformState();
}

class _mytextformState extends State<mytextform> {
  TextEditingController messagecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<Mylocal_data>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            textAlign: TextAlign.center,
            controller: messagecontroller,
            style: Theme.of(context).textTheme.headlineMedium,
            decoration: InputDecoration(
              
                suffix: InkWell(
                  onTap: () async {
                    await provider.put_Data(messagecontroller.text);
                    messagecontroller.clear();
                  },
                  child: Icon(
                    Icons.send,
                  ),
                ),
                hintText: "type message",
                hintStyle:Theme.of(context).textTheme.headlineMedium,
               
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        );
      },
    );
  }
}
