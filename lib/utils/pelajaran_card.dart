import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PelajaranCard extends StatelessWidget {
  const PelajaranCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget category_mudah() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
            color: purpleColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(6)),
        child: Text(
          "Mudah",
          style: mediumTextStyle.copyWith(
            fontSize: 10,
            color: purpleColor,
          ),
        ),
      );
    }

    Widget category_sedang() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
            color: purpleColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(6)),
        child: Text(
          "Sedang",
          style: mediumTextStyle.copyWith(
            fontSize: 10,
            color: purpleColor,
          ),
        ),
      );
    }

    Widget category_sulit() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
            color: purpleColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(6)),
        child: Text(
          "Sulit",
          style: mediumTextStyle.copyWith(
            fontSize: 10,
            color: purpleColor,
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 100,
            spreadRadius: 4,
            color: blackColor.withOpacity(0.04),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              category_mudah(),
              SizedBox(
                height: 2,
              ),
              Text(
                "Alfabet",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 26,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LinearPercentIndicator(
                    width: 150,
                    lineHeight: 12,
                    percent: 0.5,
                    backgroundColor: darkGrayColor.withOpacity(0.5),
                    progressColor: purpleColor,
                    barRadius: Radius.circular(10),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
