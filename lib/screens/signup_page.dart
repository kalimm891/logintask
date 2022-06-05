// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/constant/mystring.dart';
import 'package:test/screens/login_page.dart';
import 'package:test/theme/colors.dart';
import 'package:test/theme/text_style.dart';
import 'package:test/widget/email_textfield.dart';
import 'package:test/widget/password_textfield.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUp> createState() => _SignUpeState();
}

class _SignUpeState extends ConsumerState<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.transparent,
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    MyString.signUp,
                    style: whiteM40,
                  ),
                ),
                SizedBox(
                  height: 180,
                ),
                EmailTextField(
                  text: MyString.enterEmail,
                  control: email,
                ),
                SizedBox(
                  height: 25,
                ),
                TextfieldPass(
                  pass: MyString.enterPasswrd,
                  control: password,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                  ),
                  onPressed: () async {
                    await ref
                        .read(providerChangeNotifier)
                        .signUp(email: email.text, password: password.text);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 12),
                    child: Text(
                      MyString.signUp,
                      style: whiteM14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Are You a member already?',
                      style: whiteM14,
                      children: [
                        TextSpan(text: MyString.login, style: whiteM14),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
