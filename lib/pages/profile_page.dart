import 'package:flutter/material.dart';

import '../utils/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
            ],
          ),
        ),
      ),
    );
  }
}
