import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_verizon/widgets/checkbox.dart';
import 'package:my_verizon/widgets/email_login.dart';
import 'package:my_verizon/widgets/password.dart';
import 'package:my_verizon/question_widget.dart/question_page.dart';
import 'package:my_verizon/widgets/text_widget.dart';
import 'package:my_verizon/widgets/text_group.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();

    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 6,
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 80),
              TextWidget(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'user ID or verizon mobile number',
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              TextFormWidget(key: Key('email')),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
              PasswordFormWidget(),
              const SizedBox(height: 20),
              CheckboxWidget(),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: width / 8,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const QuestionPage(),
                          ),
                        );
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
                      'Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Align(alignment: Alignment.topLeft, child: TextGroupWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
