import 'dart:async';

import 'package:ajari_app_v2/utils/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, "/intro"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: purpleColor,
        body: Center(
          child: Text(
            'ajari',
            style: semiBoldTextStyle.copyWith(
              fontSize: 50,
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
