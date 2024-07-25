
import 'package:flutter/material.dart';

class myimage extends StatelessWidget {
  const myimage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(radius: 60,backgroundColor: Colors.red,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100)
          ,child: Image(image: NetworkImage(image),height: 100,width: 100,fit: BoxFit.cover,)),
      ),
    );
  }
}