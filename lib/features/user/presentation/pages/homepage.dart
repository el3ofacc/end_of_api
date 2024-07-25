import 'package:flutter/material.dart';
import 'package:random_user/features/user/presentation/widgets/horizontal.dart';
import 'package:random_user/features/user/presentation/widgets/mydrawer.dart';
import 'package:random_user/features/user/presentation/widgets/vertical.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: mydrawer(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Horizontal(),
            ),
            Vertical(),
          ],
        ));
  }
}
