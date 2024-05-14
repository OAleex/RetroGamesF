import 'package:flutter/material.dart';
import 'package:retrogamesf/pages/login.page.dart';
import 'package:retrogamesf/shared/tema.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });

    return Scaffold(
      backgroundColor: Tema.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              'RetroGamesForum',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Tema.borderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
