// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:my_verizon/form/checkbox.dart';
// import 'package:my_verizon/form/email_login.dart';
// import 'package:my_verizon/layout/layout.dart';
// import 'package:my_verizon/question_widget.dart/question_page.dart';
// import 'package:my_verizon/form/password.dart';
// import 'package:my_verizon/widgets/text_group.dart';
// import 'package:my_verizon/widgets/text_widget.dart';

// class ContainerFormWidget extends StatefulWidget {
//   const ContainerFormWidget({super.key});

//   @override
//   State<ContainerFormWidget> createState() => _ContainerFormWidgetState();
// }

// class _ContainerFormWidgetState extends State<ContainerFormWidget> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController loginController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return Container(
//       key:
//           LayOutWidget.isMobile(context)
//               ? ValueKey('mobile')
//               : LayOutWidget.isDesktop(context)
//               ? ValueKey('desktop')
//               : LayOutWidget.isTablet(context)
//               ? ValueKey('tablet')
//               : ValueKey('mobile'),
//       color: CupertinoColors.white,
//       width:
//           LayOutWidget.isMobile(context)
//               ? width
//               : LayOutWidget.isDesktop(context)
//               ? width / 6
//               : LayOutWidget.isTablet(context)
//               ? width / 3
//               : width,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 10.0),
//         child: Form(
//           autovalidateMode: AutovalidateMode.disabled,
//           key: formKey,
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment:
//                   LayOutWidget.isMobile(context)
//                       ? CrossAxisAlignment.start
//                       : CrossAxisAlignment.center,
//               children: [
//                 LayOutWidget.isMobile(context)
//                     ? SizedBox(height: 0)
//                     : SizedBox(height: 80),
//                 TextWidget(),
//                 const SizedBox(height: 20),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Text(
//                       'User ID or verizon mobile number',
//                       style: TextStyle(
//                         color: CupertinoColors.black,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w100,
//                       ),
//                     ),
//                   ),
//                 ),
//                 TextLogInWidget(
//                   key: Key('email'),
//                   formKey: formKey,
//                   loginController: loginController,
//                 ),
//                 SizedBox(height: LayOutWidget.isMobile(context) ? 10 : 20),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Text(
//                       'Password',
//                       style: TextStyle(
//                         color: CupertinoColors.black,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w100,
//                       ),
//                     ),
//                   ),
//                 ),
//                 PasswordLogInWidget(
//                   key: Key('password'),
//                   formKey: formKey,
//                   passwordController: passwordController,
//                 ),
//                 SizedBox(height: LayOutWidget.isMobile(context) ? 10 : 20),
//                 CheckboxWidget(),
//                 SizedBox(height: LayOutWidget.isMobile(context) ? 10 : 20),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: SizedBox(
//                     width:
//                         LayOutWidget.isMobile(context)
//                             ? width / 4
//                             : LayOutWidget.isDesktop(context)
//                             ? width / 8
//                             : LayOutWidget.isTablet(context)
//                             ? width / 6
//                             : width / 4,

//                     child: ElevatedButton(
//                       onPressed: () async {
//                         if (formKey.currentState!.validate()) {
//                           if (kDebugMode) {
//                             print('Login: ${loginController.text}');
//                           }
//                           if (kDebugMode) {
//                             print('Password: ${passwordController.text}');
//                           }
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder:
//                                   (context) => QuestionPage(
//                                     userID: loginController.text,
//                                     password: passwordController.text,
//                                   ),
//                             ),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         backgroundColor: CupertinoColors.black,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         minimumSize: const Size.fromHeight(50),
//                         fixedSize: const Size(80, 20),
//                       ),
//                       child: Text(
//                         'Sign in',
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: LayOutWidget.isMobile(context) ? 10 : 20),
//                 Align(alignment: Alignment.topLeft, child: TextGroupWidget()),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
