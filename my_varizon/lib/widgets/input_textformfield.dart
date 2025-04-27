import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/link.dart';

class AnswerFormFieldWidget extends StatefulWidget {
  const AnswerFormFieldWidget({super.key});

  @override
  State<AnswerFormFieldWidget> createState() => _AnswerFormFieldWidgetState();
}

class _AnswerFormFieldWidgetState extends State<AnswerFormFieldWidget> {
  TextEditingController answerController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    answerController.dispose();
    formKey.currentState?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(
      "https://secure.verizon.com/signin?_gl=1*1m3cwkt*_ga*MTU5NzA1NTY1MS4xNzQ1NzU0NzE2*_ga_12R1DX1LX7*MTc0NTc1NDcxNS4xLjEuMTc0NTc1NDcxNS42MC4wLjA.",
    );
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 400,
            height: 100,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')),
              ],
              maxLength: 25,
              maxLines: 1,
              minLines: 1,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.done,
              scrollPhysics: const BouncingScrollPhysics(),
              obscureText: false,
              controller: answerController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: CupertinoColors.systemBlue,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: CupertinoColors.systemGrey,
                    width: 1,
                  ),
                ),
                hintText: 'Enter your answer',
                hintStyle: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                ),
                label: Text(
                  'Security Question Answer',
                  style: TextStyle(
                    color: CupertinoColors.systemBlue,
                    fontSize: 14,
                  ),
                ),
                labelStyle: TextStyle(
                  color: CupertinoColors.systemBlue,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: CupertinoColors.systemGrey,
                    width: 1,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ' answer is required';
                } else if (value.length < 3) {
                  return ' answer must be at least 3 characters';
                } else if (value.length > 25) {
                  return ' answer must be less than 25 characters';
                } else if (value.contains(RegExp(r'[^a-zA-Z0-9]'))) {
                  return ' answer must not be alphanumeric';
                } else if (value.contains(RegExp(r'\s'))) {
                  return ' answer must not contain spaces';
                } else if (value.contains(RegExp(r'^[a-zA-Z0-9]{3,25}$'))) {
                  return null;
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 150,
            height: 40,
            child: Link(
              uri: url,
              target: LinkTarget.self,
              builder:
                  (context, followLink) => ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await followLink!();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: CupertinoColors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size.fromHeight(50),
                      fixedSize: const Size(80, 20),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
