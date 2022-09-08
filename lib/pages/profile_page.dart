import 'package:flutter/material.dart';

import '../utils/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerTelp = TextEditingController();
  late FocusNode focusNodeEmail;
  late FocusNode focusNodeUsername;
  late FocusNode focusNodeTelp;

  @override
  void initState() {
    // TODO: implement initState

    focusNodeEmail = FocusNode();
    focusNodeUsername = FocusNode();
    focusNodeTelp = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNodeEmail.dispose();
    focusNodeUsername.dispose();
    focusNodeTelp.dispose();

    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerTelp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool usernameFill = false;
    bool emailFill = false;
    bool telponFill = false;

    Widget profilePicture() {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 100,
            maxWidth: 100,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/images/logo_akun.png",
                    color: darkGrayColor,
                    width: 120,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(
                      Icons.edit_rounded,
                      size: 24,
                      color: whiteColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget usernameTextField() {
      return GestureDetector(
        onTap: () {
          focusNodeUsername.requestFocus();
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
                "assets/images/icon_user.png",
                width: 16,
                // color: (emailController.text != "") ? blackColor : Colors.amber,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  obscureText: true,
                  focusNode: focusNodeUsername,
                  controller: controllerUsername,
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
                  obscureText: true,
                  focusNode: focusNodeEmail,
                  controller: controllerEmail,
                  style: regulerTextStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
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

    Widget telpTextField() {
      return GestureDetector(
        onTap: () {
          focusNodeTelp.requestFocus();
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
                "assets/images/icon_call.png",
                width: 16,
                // color: (emailController.text != "") ? blackColor : Colors.amber,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  focusNode: focusNodeTelp,
                  controller: controllerTelp,
                  style: regulerTextStyle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nomor Telepon',
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

    Widget buttonSaveProfile() {
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
            Navigator.pushNamed(context, '/main');
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
                "Simpan",
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

    Future alertFillProfile() {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            title: Text(
              "Ayo isi profil anda",
              style: semiBoldTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    "Lengkapi profile Anda untuk dapat melanjutkan ke halaman utama",
                    style: regulerTextStyle,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        purpleColor.withOpacity(0.25),
                      ),
                      shadowColor: MaterialStateProperty.all(purpleColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Tidak",
                      style: mediumTextStyle.copyWith(
                        color: purpleColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
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
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        // padding: MaterialStateProperty.all(
                        //   EdgeInsets.all(20),
                        // ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(purpleColor),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 6,
                        ),
                        child: Center(
                          child: Text(
                            "Ya",
                            style: mediumTextStyle.copyWith(
                              fontSize: 18,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  if (controllerUsername.text.isEmpty ||
                      controllerEmail.text.isEmpty ||
                      controllerTelp.text.isEmpty) {
                    alertFillProfile();
                  }
                },
                child: Image.asset(
                  "assets/images/icon_back.png",
                  width: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Isi profil \nakun Anda",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              profilePicture(),
              const SizedBox(
                height: 24,
              ),
              usernameTextField(),
              const SizedBox(
                height: 20,
              ),
              emailTextField(),
              const SizedBox(
                height: 20,
              ),
              telpTextField(),
              Spacer(),
              buttonSaveProfile(),
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
