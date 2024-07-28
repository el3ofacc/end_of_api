import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_user/features/user/presentation/pages/facebookpage.dart';

class Details_screen extends StatefulWidget {
  Details_screen({super.key, required this.image, required this.name});
  String image;
  String name;
  @override
  State<Details_screen> createState() => _Details_screenState();
}

class _Details_screenState extends State<Details_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image(
                  image: NetworkImage(widget.image),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              widget.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => 
                    Facebookpage(myimage: widget.image,myname: widget.name,)));},
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("view profile",
              style: Theme.of(context).textTheme.headlineMedium,)
            ),
          ),
          SizedBox(
            height: 20,
          ),
           
               Text("your are friends on facebook",
               style: Theme.of(context).textTheme.headlineMedium,)
        ],
      ),
    );
  }
}
