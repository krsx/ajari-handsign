import 'package:flutter/material.dart';

class CategorySulit extends StatefulWidget {
  const CategorySulit({Key? key}) : super(key: key);

  @override
  State<CategorySulit> createState() => _CategorySulitState();
}

class _CategorySulitState extends State<CategorySulit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Sulit"),
        ),
      ),
    );
  }
}
