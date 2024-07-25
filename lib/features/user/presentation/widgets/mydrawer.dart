import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/core/utils/mycolor.dart';
import 'package:random_user/features/user/presentation/provider/myswich.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Myswich_provider>(
      builder: (context, provider, child) {
        return Drawer(
        child:   Column(
          children: [
            Container(
                height: 100,
                width: double.infinity,
                child: Center(child: Icon(Icons.settings))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "dark mode ",  
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ), 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Switch(
                      value: provider.oldvalue!,
                      onChanged: (value) {
                        provider.change_swich(value);
                      }),
                )
              ],
            ),
          ],
        ),
        );
      },
    );
  }
}
