import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class BuildIntroductionPage extends StatelessWidget {
  const BuildIntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          Center(
            child: Image.asset(
              "assets/images/intro1.png",
              width: 327,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Bahasa isyarat penting dalam memudahkan komunikasi dengan mereka yang tuli",
            style: semiBoldTextStyle.copyWith(fontSize: 26, color: blackColor),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
