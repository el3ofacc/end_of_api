import 'package:flutter/material.dart';
import 'package:random_user/features/user/presentation/pages/facebookpage.dart';
import 'package:random_user/features/user/presentation/pages/homepage.dart';
import 'package:random_user/features/user/presentation/pages/myfacebookweb.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({super.key});

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
 
  late Animation<double>imageanimation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    
    animationController.forward();
imageanimation=Tween<double>(begin: 0,end: 150).animate(animationController);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement( 
          context, MaterialPageRoute(builder: (context) =>Homepage()
          ));
    });
  }

  @override 
  void dispose() {
   
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
   
        SizedBox(height: 100,),
        AnimatedBuilder(animation: animationController,
        builder: ( context,child){ 
          return Center(child: CircleAvatar(radius: imageanimation.value,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image(image: AssetImage("images/download.jpg"),
            fit: BoxFit.cover,height: 300,
            width: 300,
                    ),
          ),),);
        })
        ],
      ),
    );
  }
}
