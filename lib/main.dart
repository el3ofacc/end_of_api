import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:random_user/core/utils/mytheme.dart';

import 'package:random_user/features/user/presentation/pages/welcome_screen.dart';
import 'package:random_user/features/user/presentation/provider/mylocaldata.dart';

import 'package:random_user/features/user/presentation/provider/myswich.dart';

Box? msg;
Future<Box> openbox(String boxname) async {
  if (Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationCacheDirectory()).path);
  }
  return Hive.openBox(boxname);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  msg = await openbox('msg');
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Myswich_provider()),
        ChangeNotifierProvider(create: (context) => Mylocal_data())
      ],
      child: Consumer<Myswich_provider>(
        builder: (context, provider, child) {
          return MaterialApp(
            theme: provider.oldvalue
                ? Mythemedark().apptheme_dark
                : Mythemewhite().appthemewhite,
            debugShowCheckedModeBanner: false,
            home: Welcome_Screen(),
          );
        },
      ),
    );
  }
}
