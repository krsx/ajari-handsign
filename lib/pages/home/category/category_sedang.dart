import 'package:flutter/material.dart';

class CategorySedang extends StatefulWidget {
  const CategorySedang({Key? key}) : super(key: key);

  @override
  State<CategorySedang> createState() => _CategorySedangState();
}

class _CategorySedangState extends State<CategorySedang> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Sedang"),
        ),
      ),
    );
  }
}
