 

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_user/features/user/presentation/pages/messagescreen.dart';
import 'package:random_user/features/user/presentation/widgets/post.dart';
import 'package:random_user/features/user/presentation/widgets/searchfield.dart';

class Facebookpage extends StatefulWidget {
  Facebookpage({super.key, required this.myimage,required this.myname});
  String myimage;
  String myname;
  @override
  State<Facebookpage> createState() => _FacebookpageState();
}

class _FacebookpageState extends State<Facebookpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body:  SafeArea(
        child: CustomScrollView( 
          slivers: [
        SliverToBoxAdapter(
          child: Container(
                  height: 250,width: double.infinity,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image(
                            image: NetworkImage(widget.myimage),
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                        ),
                      ),
                      Center( child: Text(widget.myname,
              style: Theme.of(context).textTheme.headlineLarge,),),
              Searchfield(),
              Divider()
                    ],
                  ),
                ),
        ),
                SliverToBoxAdapter(child: Post(newimage: widget.myimage))
          ],
        ),
      )
     
    );
  }
}
 
          
        

//         import 'package:flutter/material.dart';
// import 'package:random_user/features/user/presentation/widgets/post.dart';

// class Facebookpage extends StatefulWidget {
//   Facebookpage({super.key, required this.myimage, required this.myname});
//   final String myimage;
//   final String myname;

//   @override
//   State<Facebookpage> createState() => _FacebookpageState();
// }

// class _FacebookpageState extends State<Facebookpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Container(
//                 height: 250,
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 100,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(200),
//                         child: Image(
//                           image: NetworkImage(widget.myimage),
//                           fit: BoxFit.cover,
//                           height: 200,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Text(
//                         widget.myname,
//                         style: Theme.of(context).textTheme.headlineLarge,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Post(newimage: widget.myimage),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }