import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class CategoryMudah extends StatefulWidget {
  const CategoryMudah({Key? key}) : super(key: key);

  @override
  State<CategoryMudah> createState() => _CategoryMudahState();
}

class _CategoryMudahState extends State<CategoryMudah> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Center(
          child: Text("Mudah"),
        ),
      ),
    );
  }
}
