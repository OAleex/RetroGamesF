import 'package:flutter/material.dart';
import 'package:retrogamesf/pages/feed_page.dart';
import 'package:retrogamesf/pages/create_account.page.dart';
import 'package:retrogamesf/shared/tema.dart'; // Importe a classe Tema

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  bool _ocultarSenha = true;

  void _toggleSenha() {
    setState(() {
      _ocultarSenha = !_ocultarSenha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tema.backgroundColor, // Usando cor de fundo do Tema
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bem-vindo ao RetroGamesForum',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Tema.textColor, // Usando cor de texto do Tema
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: _emailController,
                style: TextStyle(color: Tema.textColor), // Usando cor de texto do Tema
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Tema.borderColor), // Usando cor de borda do Tema
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Tema.borderColor), // Usando cor de borda do Tema
                  ),
                  prefixIcon: Icon(Icons.email, color: Tema.borderColor), // Usando cor de ícone do Tema
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _senhaController,
                obscureText: _ocultarSenha,
                style: TextStyle(color: Tema.textColor), // Usando cor de texto do Tema
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Tema.borderColor), // Usando cor de borda do Tema
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Tema.borderColor), // Usando cor de borda do Tema
                  ),
                  prefixIcon: Icon(Icons.lock_outline,
                      color: Tema.borderColor), // Ícone de senha
                  suffixIcon: IconButton(
                    icon: Icon(
                      _ocultarSenha ? Icons.visibility_off : Icons.visibility,
                      color: Tema.buttonColor, // Usando cor de ícone do Tema
                    ),
                    onPressed: _toggleSenha,
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const FeedPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Tema.buttonColor, // Usando cor de fundo do botão do Tema
                  foregroundColor: Tema.buttonTextColor, // Usando cor de texto do botão do Tema
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: Text('Entrar'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateAccountPage()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Tema.buttonColor, // Usando cor de fundo do botão do Tema
                  foregroundColor: Tema.buttonTextColor, // Usando cor de texto do botão do Tema
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: Text('Criar conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
