import 'package:flutter/material.dart';

class TextGroupWidget extends StatelessWidget {
  const TextGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.black,

                fontWeight: FontWeight.bold,

                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot your Info?',
              style: TextStyle(
                color: Colors.black,

                fontWeight: FontWeight.bold,

                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Make a one-time payment',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,

                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Business Sign in',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
