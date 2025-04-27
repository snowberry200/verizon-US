import 'package:flutter/cupertino.dart';

class WelcomeTextWidget extends StatefulWidget {
  const WelcomeTextWidget({super.key});

  @override
  State<WelcomeTextWidget> createState() => _WelcomeTextWidgetState();
}

class _WelcomeTextWidgetState extends State<WelcomeTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome To Verizon Cloud',
      style: TextStyle(
        color: CupertinoColors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
