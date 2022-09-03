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
          onPressed: () => controller.nextPage(
            duration: const Duration(microseconds: 500),
            curve: Curves.easeInOut,
          ),
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
        backgroundColor: Colors.white,
        body: PageView(
          physics: BouncingScrollPhysics(),
          controller: controller,
          onPageChanged: (value) {
            setState(() => isLastPage = value == 2);
          },
          children: [
            BuildIntroductionPage(),
            BuildIntroductionPage(),
            BuildIntroductionPage(),
          ],
        ),
        bottomSheet: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: 150,
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
              buttonNext(),
            ],
          ),
        ),
      ),
    );
  }
}
