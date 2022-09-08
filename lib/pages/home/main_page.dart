import 'package:ajari_app_v2/pages/home/home_page.dart';
import 'package:ajari_app_v2/pages/home/translate_page.dart';
import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget translateButton() {
      return FloatingActionButton(
        backgroundColor: purpleColor,
        child: Image.asset(
          "assets/images/icon_camera.png",
          width: 26,
        ),
        onPressed: () {},
      );
    }

    Widget customBottomNavbar() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: whiteColor,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              // currentIndex = value;
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            selectedItemColor: purpleColor,
            selectedLabelStyle: mediumTextStyle.copyWith(
              fontSize: 12,
              color: purpleColor,
            ),
            unselectedLabelStyle: mediumTextStyle.copyWith(
              fontSize: 12,
              color: purpleColor,
            ),
            unselectedItemColor: darkGrayColor,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/icon_home_v2.png",
                  width: 25,
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/icon_home_v2.png",
                  width: 25,
                ),
                label: 'Kamus',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return TranslatePage();
          break;
        case 2:
          return TranslatePage();
          break;
        default:
          return SizedBox();
      }
    }

    return Scaffold(
      extendBody: true,
      floatingActionButton: translateButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNavbar(),
      body: body(),
    );
  }
}
