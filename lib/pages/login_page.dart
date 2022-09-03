import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late FocusNode focusNodeEmail;

  @override
  void initState() {
    // TODO: implement initState
    focusNodeEmail = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNodeEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget emailTextField() {
      return GestureDetector(
        onTap: () {
          focusNodeEmail.requestFocus();
        },
        child: Container(
          height: 60,
          width: double.infinity - 48,
          decoration: BoxDecoration(
            // color: (focusNodeEmail.hasFocus) ? purpleColor : grayColor,
            color: grayColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/images/icon_email.png",
                width: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  focusNode: focusNodeEmail,
                  controller: emailController,
                  style: regulerTextStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget buttonLogin() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 12),
              blurRadius: 48,
              color: purpleColor.withOpacity(0.6),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(purpleColor),
            elevation: MaterialStateProperty.all(0),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                "Masuk",
                style: mediumTextStyle.copyWith(
                  fontSize: 22,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/intro'),
                child: Image.asset(
                  "assets/images/icon_back.png",
                  width: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Masuk ke \nakun Anda",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 60 - 12,
              ),
              emailTextField(),
              const SizedBox(
                height: 20,
              ),
              emailTextField(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(color: grayColor),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              buttonLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
