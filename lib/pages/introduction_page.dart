import 'package:ajari_app_v2/utils/build_introduction_page.dart';
import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonNext() {
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
          onPressed: () => isLastPage
              ? () {}
              : controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
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
                "Selanjutnya",
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

    Widget buttonLogin() {
      return Expanded(
        child: Container(
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
            onPressed: () => Navigator.pushNamed(
              context,
              '/login',
            ),
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
        ),
      );
    }

    Widget buttonRegister() {
      return Expanded(
        child: Container(
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
            onPressed: () => Navigator.pushNamed(context, '/register'),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    width: 2,
                    color: purpleColor,
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(whiteColor),
              elevation: MaterialStateProperty.all(0),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Text(
                  "Daftar",
                  style: mediumTextStyle.copyWith(
                    fontSize: 22,
                    color: purpleColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          physics: BouncingScrollPhysics(),
          controller: controller,
          onPageChanged: (value) {
            setState(() => isLastPage = value == 2);
          },
          children: const [
            BuildIntroductionPage(
              text:
                  "Bahasa isyarat penting dalam memudahkan komunikasi dengan mereka yang tuli",
              imageUrl: "assets/images/intro1.png",
            ),
            BuildIntroductionPage(
              text:
                  " Kemudahan dalam mempelajari bahasa isyarat kapanpun dan dimanapun",
              imageUrl: "assets/images/intro2.png",
            ),
            BuildIntroductionPage(
              text:
                  "Ayo mulai tingkatkan kemampuan bahasa isyarat bersama Ajari ",
              imageUrl: "assets/images/intro3.png",
            ),
          ],
        ),
        bottomSheet: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 170,
          width: double.infinity,
          child: Column(
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotColor: Color(0xffE5E5E5),
                  dotHeight: 12,
                  dotWidth: 12,
                  radius: 14,
                  spacing: 16,
                  activeDotColor: purpleColor,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              isLastPage
                  ? Row(
                      children: [
                        buttonLogin(),
                        SizedBox(
                          width: 20,
                        ),
                        buttonRegister()
                      ],
                    )
                  : buttonNext(),
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
