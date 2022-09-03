import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class BuildIntroductionPage extends StatelessWidget {
  final String text;
  final String imageUrl;
  const BuildIntroductionPage({
    Key? key,
    required this.text,
    required this.imageUrl,
  }) : super(key: key);

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
            height: 24,
          ),
          Center(
            child: Image.asset(
              imageUrl,
              height: 300,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            text,
            style: semiBoldTextStyle.copyWith(fontSize: 24, color: blackColor),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
