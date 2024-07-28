// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:random_user/features/user/data/datasources/api_service.dart';
// import 'package:random_user/features/user/data/models/facebook_news.dart';
// import 'package:random_user/features/user/presentation/pages/myfacebookweb.dart';
// import 'package:random_user/features/user/presentation/provider/catagoryprovider.dart';
// import 'package:random_user/features/user/presentation/provider/changelike.dart';
// import 'package:random_user/features/user/presentation/widgets/mydialog.dart';

// class Post extends StatefulWidget {
//   Post({super.key, required this.newimage});
//   String newimage;
//   @override
//   State<Post> createState() => _PostState();
// }

// class _PostState extends State<Post> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Catagoryprovider>(
//       builder: (context, provider, child) {
//         return FutureBuilder(
//             future: facebook_services()
//                 .fetch_facebook_news(context, provider.field),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//     Provider.of<Changelike>(context, listen: false).initalaize(snapshot.data!.length);

//                 return ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         height: 360,
//                         width: double.infinity,
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: double.infinity,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 25,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(25),
//                                       child: Image(
//                                         image: NetworkImage(widget.newimage),
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Expanded(
//                                     child: snapshot.data![index].image !=
//                                                 null &&
//                                             snapshot.data![index].title != null
//                                         ? Text(
//                                             snapshot.data![index].title
//                                                 .toString(),
//                                             maxLines: 2,
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .headlineMedium,
//                                           )
//                                         : Text(
//                                             "update profile",
//                                             maxLines: 2,
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .headlineMedium,
//                                           ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               height: 210,
//                               width: double.infinity,
//                               child: snapshot.data![index].image != null
//                                   ? Image(
//                                       image: NetworkImage(snapshot
//                                           .data![index].image
//                                           .toString()),
//                                       fit: BoxFit.cover,
//                                       height: 210,
//                                     )
//                                   : Image(
//                                       image: NetworkImage(widget.newimage),
//                                       fit: BoxFit.cover,
//                                       height: 210,
//                                     ),
//                             ),
//                             Consumer<Changelike>(
//                               builder: (context, provider, child) {
//                                 return Container(
//                                     height: 70,
//                                     width: double.infinity,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         Myfacebookweb()));
//                                           },
//                                           child: Icon(
//                                             Icons.share,
//                                             color: Colors.blue,
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             provider.changelikefun(index);
//                                           },
//                                           child: Icon(
//                                             Icons.favorite,
//                                             color: provider.islike[index]
//                                                 ? Colors.blue
//                                                 : Colors.grey,
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: provider.chagngehand(index),
//                                           child: Icon(
//                                             Icons.thumb_up,
//                                             color: provider.handsign[index]
//                                                 ? Colors.blue
//                                                 : Colors.grey,
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             provider.changeisisnotlike(index);
//                                           },
//                                           child: Icon(
//                                             Icons.thumb_down,
//                                             color: provider.isnotlike[index]
//                                                 ? Colors.blue
//                                                 : Colors.grey,
//                                           ),
//                                         )
//                                       ],
//                                     ));
//                               },
//                             ),
//                             Divider()
//                           ],
//                         ),
//                       );
//                     });
//               } else if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else {
//                 return Center(child: Text("no data available"));
//               }
//             });
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/features/user/data/datasources/api_service.dart';
import 'package:random_user/features/user/presentation/pages/myfacebookweb.dart';
import 'package:random_user/features/user/presentation/provider/catagoryprovider.dart';
import 'package:random_user/features/user/presentation/provider/changelike.dart';

class Post extends StatefulWidget {
  Post({super.key, required this.newimage});
  String newimage;
  
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Catagoryprovider>(
      builder: (context, provider, child) {
        return FutureBuilder(
          future: facebook_services()
              .fetch_facebook_news(context, provider.field),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Provider.of<Changelike>(context, listen: false)
                  .initalaize(snapshot.data!.length);

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 360,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image(
                                    image: NetworkImage(widget.newimage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: snapshot.data![index].image != null &&
                                        snapshot.data![index].title != null
                                    ? Text(
                                        snapshot.data![index].title.toString(),
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      )
                                    : Text(
                                        "update profile",
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 210,
                          width: double.infinity,
                          child: snapshot.data![index].image != null
                              ? Image(
                                  image: NetworkImage(
                                      snapshot.data![index].image.toString()),
                                  fit: BoxFit.cover,
                                  height: 210,
                                )
                              : Image(
                                  image: NetworkImage(widget.newimage),
                                  fit: BoxFit.cover,
                                  height: 210,
                                ),
                        ),
                        Consumer<Changelike>(
                          builder: (context, likeProvider, child) {
                            return Container(
                              height: 70,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Myfacebookweb(),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      likeProvider.changelikefun(index);
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: likeProvider.islike[index]
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      likeProvider.chagngehand(index);
                                    },
                                    child: Icon(
                                      Icons.thumb_up,
                                      color: likeProvider.handsign[index]
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      likeProvider.changeisisnotlike(index);
                                    },
                                    child: Icon(
                                      Icons.thumb_down,
                                      color: likeProvider.isnotlike[index]
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text("no data available"));
            }
          },
        );
      },
    );
  }
}
