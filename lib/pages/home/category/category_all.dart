import 'package:flutter/material.dart';

class CategoryAll extends StatefulWidget {
  const CategoryAll({Key? key}) : super(key: key);

  @override
  State<CategoryAll> createState() => _CategoryAllState();
}

class _CategoryAllState extends State<CategoryAll> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("All"),
        ),
      ),
    );
  }
}
