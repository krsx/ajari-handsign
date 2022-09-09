import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class ArtikelCard extends StatelessWidget {
  const ArtikelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/article1.png",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 140,
                  ),
                  child: Text(
                    "Perkembangan Bahasa Isyarat di Bali",
                    style: mediumTextStyle.copyWith(
                      fontSize: 12,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
