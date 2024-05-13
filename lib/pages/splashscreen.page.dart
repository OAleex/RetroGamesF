import 'package:flutter/material.dart';
import 'package:retrogamesf/pages/login.page.dart';
import 'package:retrogamesf/shared/tema.dart'; // Importando a classe Tema corretamente

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
      backgroundColor: Tema.backgroundColor, // Usando a cor de fundo do Tema
      body: Center(
        child: Text(
          'RetroGamesForum',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Tema.borderColor, // Usando a cor de texto definida no Tema
          ),
        ),
      ),
    );
  }
}
