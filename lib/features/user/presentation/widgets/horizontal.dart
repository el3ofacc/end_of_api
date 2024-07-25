import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:random_user/features/user/data/datasources/api_service.dart';
import 'package:random_user/features/user/presentation/widgets/mydialog.dart';

class Horizontal extends StatelessWidget {
  Horizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 7,
      width: double.infinity,
     
      child: FutureBuilder(
        future: Api_Service().Fetch_data(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var mydata = snapshot.data![index];
                  return Column(
                    children: [ 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar( 
                          radius: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(fit: BoxFit.cover,
                           height: 80,width: 80,
                                    image: NetworkImage(
                                        mydata.picturelarge.toString())) ??
                                CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      Text(
                        mydata.firstname.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  );  
                });
          } 
          else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), 
            );
          } 
          else {
           return Center(
              child: Text(
                'no data available',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            );
          }
         
        },
      ),
    );
  }
}
 
 


