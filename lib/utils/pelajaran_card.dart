import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class PelajaranCard extends StatelessWidget {
  const PelajaranCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        children: [Container()],
      ),
    );
  }
}
