import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  const TextFormWidget({super.key});

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      scrollPhysics: const BouncingScrollPhysics(),
      autovalidateMode: AutovalidateMode.always,
      obscureText: false,
      obscuringCharacter: '*',
      cursorColor: Colors.white,
      cursorWidth: 1,
      cursorHeight: 20,
      cursorRadius: const Radius.circular(5),
      showCursor: true,
      readOnly: false,

      enableInteractiveSelection: true,
      maxLines: 1,
      focusNode: FocusNode(),
      enableIMEPersonalizedLearning: true,
      selectionControls: CupertinoTextSelectionControls(),
      textCapitalization: TextCapitalization.none,
      autofillHints: const [AutofillHints.email],
      enableSuggestions: true,
      autocorrect: true,
      autofocus: false,
      textAlign: TextAlign.start,
      strutStyle: const StrutStyle(),
      style: const TextStyle(),
      controller: loginController,
      validator:
          (ifemail) =>
              !EmailValidator.validate(ifemail!)
                  ? 'Enter a valid User ID'
                  : null,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        focusedBorder: myfocusborder(),
        focusColor: Colors.red,

        contentPadding: const EdgeInsets.only(left: 10, right: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
      ),
    );
  }

  OutlineInputBorder myfocusborder() => const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(0)),
    borderSide: BorderSide(
      style: BorderStyle.solid,
      color: CupertinoColors.systemBlue,
      width: 1,
    ),
  );
}
