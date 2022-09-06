import 'package:ajari_app_v2/helper/auth_services.dart';
import 'package:ajari_app_v2/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late FocusNode focusNodeEmail;
  late FocusNode focusNodePassword;
  bool isRemember = false;

  @override
  void initState() {
    // TODO: implement initState
    focusNodeEmail = FocusNode();
    focusNodePassword = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
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
                width: 16,
                // color: (emailController.text != "") ? blackColor : Colors.amber,
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
                    hintText: 'Username',
                    hintStyle: regulerTextStyle.copyWith(
                      color: darkGrayColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget passwordTextField() {
      return GestureDetector(
        onTap: () {
          focusNodePassword.requestFocus();
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
                "assets/images/icon_password.png",
                width: 16,
                // color: (emailController.text != "") ? blackColor : Colors.amber,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  obscureText: true,
                  focusNode: focusNodePassword,
                  controller: passwordController,
                  style: regulerTextStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: regulerTextStyle.copyWith(
                      color: darkGrayColor,
                    ),
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
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 12),
              blurRadius: 48,
              color: purpleColor.withOpacity(0.6),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            AuthServices.signIn(
              emailController.text,
              passwordController.text,
            );

            // User? firebaseUser = Provider.of<User?>(context);
            // if (firebaseUser != null) {
            //   Navigator.pushNamed(context, '/profile');
            // }
            // print("User yang masuk adalah $result");

            FirebaseAuth.instance.authStateChanges().listen(
              (User? user) {
                if (user != null) {
                  print("ini user id:\n");
                  print(user.uid);

                  Navigator.pushNamed(context, '/profile');
                }
              },
            );
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
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

    Widget buttonRemember() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isRemember = !isRemember;
              });
            },
            child: (isRemember)
                ? Container(
                    width: 22,
                    height: 22,
                    child: Image.asset(
                      "assets/images/icon_remember.png",
                    ),
                  )
                : Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: grayColor,
                      border: Border.all(
                        color: purpleColor,
                        width: 2,
                      ),
                    ),
                  ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "Ingat saya",
            style: mediumTextStyle,
          )
        ],
      );
    }

    Widget divider() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 1,
            decoration: BoxDecoration(
              color: darkGrayColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "atau",
            style: mediumTextStyle.copyWith(
              color: darkGrayColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 120,
            height: 1,
            decoration: BoxDecoration(
              color: darkGrayColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      );
    }

    Widget buttonLoginGoogle() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  width: 2,
                  color: blackColor,
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(whiteColor),
            elevation: MaterialStateProperty.all(0),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Google.png",
                  width: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Masuk dengan Google",
                  style: mediumTextStyle.copyWith(fontSize: 16),
                )
              ],
            )),
          ),
        ),
      );
    }

    Widget registerTextButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Belum mempunyai akun?",
            style: regulerTextStyle.copyWith(
              color: darkGrayColor,
              fontSize: 12,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/register'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              overlayColor: MaterialStateProperty.all(
                purpleColor.withOpacity(0.25),
              ),
              shadowColor: MaterialStateProperty.all(purpleColor),
            ),
            child: Text(
              "Daftar sekarang",
              style: regulerTextStyle.copyWith(
                color: purpleColor,
                fontSize: 12,
              ),
            ),
          )
        ],
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
                onTap: () => Navigator.pop(context),
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
                height: 60 - 20,
              ),
              emailTextField(),
              const SizedBox(
                height: 20,
              ),
              passwordTextField(),
              const SizedBox(
                height: 14,
              ),
              buttonRemember(),
              const SizedBox(
                height: 14,
              ),
              buttonLogin(),
              const Spacer(),
              divider(),
              const Spacer(),
              buttonLoginGoogle(),
              const SizedBox(
                height: 20,
              ),
              registerTextButton(),
              const SizedBox(
                height: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
