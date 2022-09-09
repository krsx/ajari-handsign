import 'package:flutter/material.dart';

class KamusPage extends StatefulWidget {
  const KamusPage({Key? key}) : super(key: key);

  @override
  State<KamusPage> createState() => _KamusPageState();
}

class _KamusPageState extends State<KamusPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Kamus"),
        ),
      ),
    );
  }
}
