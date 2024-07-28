import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/features/user/data/datasources/api_service.dart';
import 'package:random_user/features/user/presentation/provider/catagoryprovider.dart';

class Searchfield extends StatefulWidget {
  const Searchfield({super.key});

  @override
  State<Searchfield> createState() => _SearchfieldState();
}

class _SearchfieldState extends State<Searchfield> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<Catagoryprovider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
            controller: searchcontroller,
            decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      provider.changecatagory(searchcontroller.text.trim());
                     searchcontroller.clear();
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.blue,
                      size: 30,
                    )),
                hintText: "search",
                hintStyle: Theme.of(context).textTheme.headlineMedium,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          ),
        );
      },
    );
  }
}
