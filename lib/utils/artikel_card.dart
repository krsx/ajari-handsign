import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class ArtikelCard extends StatelessWidget {
  const ArtikelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 200,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/article1.png",
                fit: BoxFit.fitWidth,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 150,
                          ),
                          child: Text(
                            "Perkembangan Bahasa Isyarat di Bali",
                            style: mediumTextStyle.copyWith(
                              fontSize: 12,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/images/icon_arrow.png",
                        width: 12,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
