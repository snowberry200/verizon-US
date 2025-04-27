import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({super.key});

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  List<String> items = [
    'What was the first live concert you attended?',
    'Where did you and your spouse first meet?',
    'What was your favorite place to visit as a child?',
    'What was the first name of your first roommate?',
    'What is the name of a memorable place you visited?',
    'What was your favorite restaurant in college?',
  ];
  String selectedValue = 'What was the first live concert you attended?';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: CupertinoColors.systemBlue, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: CupertinoColors.systemGrey, width: 1),
          ),
          labelText: 'Security Question',
          labelStyle: TextStyle(
            color: CupertinoColors.systemBlue,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: CupertinoColors.systemGrey, width: 1),
          ),
        ),
        focusColor: CupertinoColors.systemBlue,
        autofocus: true,
        dropdownColor: CupertinoColors.white,
        items:
            items
                .map(
                  (item) => DropdownMenuItem(
                    alignment: AlignmentDirectional.centerStart,
                    value: item,
                    child: Center(
                      child: Text(
                        item,
                        style: TextStyle(
                          color: CupertinoColors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
        icon: const Icon(Icons.arrow_drop_down),

        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        value: selectedValue,
      ),
    );
  }
}
