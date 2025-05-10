// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_verizon/form/checkbox.dart';

import 'package:my_verizon/homepage.dart';
import 'package:my_verizon/layout/layout.dart';
import 'package:my_verizon/question_widget.dart/question_page.dart';
import 'package:my_verizon/widgets/text_group.dart';
import 'package:my_verizon/widgets/text_widget.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool isPasswordVissible = false;

  RegExp passValid = RegExp(r"(?=.*\d{2,4})(?=.*[A-Z])(?=.*\W)");
  bool validatePassword(String pass) {
    String passWord = pass.trim();
    if (passValid.hasMatch(passWord)) {
      return true;
    } else {
      return false;
    }
  }

  FormPage formPage = FormPage();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
              LayOutWidget.isMobile(context)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
          children: [
            LayOutWidget.isMobile(context)
                ? SizedBox(height: 0)
                : SizedBox(height: 80),
            TextWidget(),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'User ID or verizon mobile number',
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            TextFormField(
              maxLines: 1,
              focusNode: FocusNode(),
              autovalidateMode: AutovalidateMode.disabled,
              enableIMEPersonalizedLearning: true,
              selectionControls: CupertinoTextSelectionControls(),
              textCapitalization: TextCapitalization.none,
              enableInteractiveSelection: true,
              autofillHints: const [AutofillHints.email],
              enableSuggestions: true,
              autocorrect: true,
              showCursor: true,
              autofocus: false,
              textAlign: TextAlign.start,
              strutStyle: const StrutStyle(),
              style: const TextStyle(),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              // inputFormatters: [
              //   FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')),
              // ],
              key: Key('email'),

              controller: loginController = TextEditingController(),
              validator:
                  (ifemail) =>
                      !EmailValidator.validate(ifemail!)
                          ? 'Enter a valid User ID'
                          : null,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                focusedBorder: formPage.myfocusborder(),
                focusColor: Colors.red,

                contentPadding: const EdgeInsets.only(left: 10, right: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ),
            ),
            SizedBox(height: LayOutWidget.isMobile(context) ? 10 : 20),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            TextFormField(
              key: ValueKey('password'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                focusedBorder: formPage.myfocusborder(),
                focusColor: Colors.red,

                contentPadding: const EdgeInsets.only(left: 10, right: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),

                suffixIcon: IconButton(
                  hoverColor: Colors.transparent,
                  icon:
                      isPasswordVissible
                          ? const Tooltip(
                            message: 'show password',
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.white,
                            ),
                            child: Text(
                              'show',
                              style: TextStyle(
                                color: CupertinoColors.systemBlue,
                                decoration: TextDecoration.underline,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                          : const Tooltip(
                            message: 'hide password',
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: CupertinoColors.white,
                            ),
                            child: Text(
                              'hide',
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  onPressed:
                      () => setState(
                        () => isPasswordVissible = !isPasswordVissible,
                      ),
                ),
              ),
              obscureText: !isPasswordVissible,
              controller: passwordController = TextEditingController(),
              validator: (ifpassword) {
                if (ifpassword!.isNotEmpty && ifpassword.length < 6) {
                  return 'please enter correct password';
                } else if (ifpassword.isEmpty) {
                  return "field can not be empty";
                }
                bool result = validatePassword(ifpassword);
                if (result) {
                  // create account event
                  return null;
                } else {
                  return " Enter a correct password";
                }
              },
            ),
            SizedBox(height: LayOutWidget.isMobile(context) ? 10 : 20),
            CheckboxWidget(),
            SizedBox(height: LayOutWidget.isMobile(context) ? 10 : 20),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width:
                    LayOutWidget.isMobile(context)
                        ? width / 4
                        : LayOutWidget.isDesktop(context)
                        ? width / 8
                        : LayOutWidget.isTablet(context)
                        ? width / 6
                        : width / 4,

                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (kDebugMode) {
                        print('Login: ${loginController.text}');
                      }
                      if (kDebugMode) {
                        print('Password: ${passwordController.text}');
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => QuestionPage(
                                userID: loginController.text,
                                password: passwordController.text,
                              ),
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
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: LayOutWidget.isMobile(context) ? 10 : 20),
            Align(alignment: Alignment.topLeft, child: TextGroupWidget()),
          ],
        ),
      ),
    );
  }
}
