import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtikelCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const ArtikelCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> urlLauncher() async {
      Uri url = Uri.parse("https://pub.dev/packages/url_launcher/example");
      // if (await canLaunchUrl(url)) {
      //   await launchUrl(
      //     url,
      //     mode: LaunchMode.externalApplication,
      //   );
      // } else {
      //   throw 'Url tidak bisa dilaunch $url';
      // }
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }

    return GestureDetector(
      onTap: () {
        urlLauncher();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 200,
          child: Stack(
            children: [
              Image.asset(
                imageUrl,
                fit: BoxFit.cover,
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
                            maxWidth: 120,
                          ),
                          child: Text(
                            title,
                            // overflow: TextOverflow.ellipsis,
                            style: mediumTextStyle.copyWith(
                              fontSize: 11,
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
