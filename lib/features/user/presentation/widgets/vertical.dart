import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_user/features/user/data/datasources/api_service.dart';
import 'package:random_user/features/user/presentation/pages/messagescreen.dart';

class Vertical extends StatelessWidget {
  Vertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api_Service().Fetch_data(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: snapshot.data!.length,
              (context, index) {
                var element = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                         Message_screen(image: element.picturelarge.toString(),
                         name: element.firstname.toString(),)));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(300), 
                          child: Image(
                                image: NetworkImage(
                                    element.picturelarge.toString()),
                                fit: BoxFit.cover,
                                height: 60,
                                width: 60,
                              ) ??
                              CircularProgressIndicator()),
                    ),
                    title: Text(
                          "${element.title} ${element.firstname} ${element.lastname}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ) ??
                        Text("no data"),
                    subtitle: Text(element.country.toString(),
                            style:
                                Theme.of(context).textTheme.headlineMedium) ??
                        Text("no data"),
                  ),
                );
              },
            ));
          } else {
            return SliverToBoxAdapter(
              child: Center(
                  child: Text(
                'no available data',
                style: Theme.of(context).textTheme.headlineMedium,
              )),
            );
          }
        });
  }
}
