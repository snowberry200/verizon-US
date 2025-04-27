import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_verizon/widgets/form.dart';

class AppleBar extends StatelessWidget {
  const AppleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder:
          (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              scrolledUnderElevation: 0,
              shadowColor: CupertinoColors.black,
              centerTitle: true,
              expandedHeight: 0,
              backgroundColor: const Color.fromARGB(139, 19, 19, 19),
              title: Text(
                'Have a phone you love? Get up to 500 when you bring your phone.',
                style: TextStyle(fontSize: 12, color: CupertinoColors.white),
              ),
            ),
          ],
      body: Padding(
        padding: const EdgeInsets.only(left: 250.0),
        child: SizedBox(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [SizedBox(height: 80), FormWidget()],
            ),
          ),
        ),
      ),
    );
  }
}
