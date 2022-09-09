import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class ArtikelCard extends StatelessWidget {
  const ArtikelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/article1.png",
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                // Text(
                //   "Perkembangan Bahasa Isyarat di Bali",
                //   style: mediumTextStyle.copyWith(
                //     fontSize: 10,
                //     color: whiteColor,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
