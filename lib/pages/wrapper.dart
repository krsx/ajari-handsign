import 'package:ajari_app_v2/main.dart';
import 'package:ajari_app_v2/pages/home_page.dart';
import 'package:ajari_app_v2/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);
    print('test');
    return (firebaseUser == null) ? LoginPage() : HomePage();
  }
}
