import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_verizon/widgets/drop_down_menu.dart';
import 'package:my_verizon/widgets/input_textformfield.dart';
import 'package:my_verizon/widgets/sliver_appbar.dart';
import 'package:my_verizon/widgets/welcome_to_verizon.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  SliverAppWidget sliverAppWidget = const SliverAppWidget();
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder:
          (BuildContext context, bool innerBoxIsScrolled) => [
            sliverAppWidget.sliverNewMethod(context),
          ],
      body: Scaffold(
        backgroundColor: CupertinoColors.white,
        body: Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 5,
                child: SizedBox(
                  child: Container(
                    color: CupertinoColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: SizedBox()),
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                WelcomeTextWidget(),
                                const SizedBox(height: 20),
                                Text(
                                  'Security Question',
                                  style: TextStyle(fontSize: 12),
                                ),

                                DropDownMenuWidget(),
                                Text(
                                  'Security Question Answer',
                                  style: TextStyle(fontSize: 12),
                                ),
                                AnswerFormFieldWidget(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
