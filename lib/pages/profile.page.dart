import 'package:flutter/material.dart';
import 'package:retrogamesf/shared/tema.dart'; // Certifique-se de importar o Tema

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil', style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Tema.backgroundColor, // Usando a cor de fundo do Tema
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 80, // Aumentado para um tamanho maior
                backgroundImage: AssetImage('assets/profile.jpg'), // Substitua com a sua imagem
              ),
              const SizedBox(height: 40),
              _buildInfoBox(context, "Nome do Usuário", "Nome do Usuário"),
              const SizedBox(height: 20),
              _buildInfoBox(context, "E-mail", "example@example.com"),
              const SizedBox(height: 20),
              _buildInfoBox(context, "Data de Nascimento", "01/01/1990"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context, String title, String content) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Text(content, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Tema.textColor)),
      decoration: BoxDecoration(
        color: Tema.textoInputColor, // Usando a nova cor de input para fundo das caixas de informação
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
