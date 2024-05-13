import 'package:flutter/material.dart';
import 'package:retrogamesf/pages/feed_page.dart';
import 'package:retrogamesf/pages/login.page.dart'; // Importe a LoginPage para redirecionamento
import 'package:retrogamesf/shared/tema.dart'; // Importe a classe Tema

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPage createState() => _CreateAccountPage();
}

class _CreateAccountPage extends State<CreateAccountPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _ocultarSenha = true;

  void _toggleSenha() {
    setState(() {
      _ocultarSenha = !_ocultarSenha;
    });
  }

  void _registerAndEnter() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const FeedPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tema.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Crie sua conta no RetroGamesForum',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Tema.textColor,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _emailController,
                style: TextStyle(color: Tema.textColor),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Tema.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Tema.borderColor),
                  ),
                  prefixIcon: Icon(Icons.email, color: Tema.borderColor),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _senhaController,
                obscureText: _ocultarSenha,
                style: TextStyle(color: Tema.textColor),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Tema.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Tema.borderColor),
                  ),
                  prefixIcon: Icon(Icons.lock_outline, color: Tema.borderColor),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _ocultarSenha ? Icons.visibility_off : Icons.visibility,
                      color: Tema.buttonColor,
                    ),
                    onPressed: _toggleSenha,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _registerAndEnter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Tema.buttonColor,
                  foregroundColor: Tema.buttonTextColor,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Ajuste do padding para corresponder ao login
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: Text('Registrar\ne Entrar'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Tema.buttonColor,
                  foregroundColor: Tema.buttonTextColor,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: Text('Fazer login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
