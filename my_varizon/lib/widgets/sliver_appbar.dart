import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_verizon/widgets/applebar.dart';

class SliverAppWidget extends StatelessWidget {
  const SliverAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder:
          (BuildContext context, bool innerBoxIsScrolled) => [
            sliverNewMethod(context),
          ],
      body: AppleBar(),
    );
  }

  SliverAppBar sliverNewMethod(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      toolbarHeight: 80,
      shadowColor: CupertinoColors.black,
      elevation: 150,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleSpacing: 0,
      backgroundColor: CupertinoColors.black,
      centerTitle: true,
      expandedHeight: 100,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SizedBox(
          width: 100,
          child: Transform.scale(
            scale: 1.5,
            child: Center(
              child: const Image(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                image: AssetImage('images/verizon.png'),
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
      title: SafeArea(
        child: SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Shop',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'why verizon',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Support',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: Text(
                  "Sign in",
                  style: TextStyle(color: CupertinoColors.white),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: CupertinoColors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag, color: CupertinoColors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu, color: CupertinoColors.white),
              ),
            ],
          ),
        ),
      ],

      pinned: true,
      floating: false,
    );
  }
}
