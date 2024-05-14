import 'package:flutter/material.dart';
import 'package:retrogamesf/shared/tema.dart';

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
      backgroundColor: Tema.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/Avatar.png'),
              ),
              const SizedBox(height: 40),
              _buildInfoBox(context, "name", "Player1"),
              const SizedBox(height: 20),
              _buildInfoBox(context, "E-mail", "player1@g.com"),
              const SizedBox(height: 20),
              _buildInfoBox(context, "dn", "09/06/1990"),
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
        color: Tema.textoInputColor,
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
