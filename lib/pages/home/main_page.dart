import 'package:ajari_app_v2/pages/home/home_page.dart';
import 'package:ajari_app_v2/pages/home/kamus_page.dart';
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
      return Container(
        height: 68,
        width: 68,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: purpleColor,
            // elevation: 10,
            child: Container(
              // padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 15),
                    blurRadius: 24,
                    spreadRadius: 20,
                    color: purpleColor.withOpacity(0.6),
                  ),
                ],
              ),
              child: Image.asset(
                "assets/images/icon_camera.png",
                width: 26,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/translate');
            },
          ),
        ),
      );
    }

    Widget customBottomNavbar() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
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
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Icon(
                    Icons.house,
                    size: 34,
                  ),
                ),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Icon(
                    Icons.book,
                    size: 34,
                  ),
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
          return KamusPage();
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
      resizeToAvoidBottomInset: false,
      body: body(),
    );
  }
}
