import 'package:flutter/material.dart';
import 'package:retrogamesf/shared/tema.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regras do Fórum", style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Tema.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Regras Gerais do Fórum RetroGames",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Tema.textColor),
            ),
            SizedBox(height: 10),
            Text(
              "1. Respeite todos os membros do fórum para manter uma comunidade saudável.",
              style: TextStyle(fontSize: 16, color: Tema.textColor),
            ),
            SizedBox(height: 5),
            Text(
              "2. Não poste conteúdo ofensivo, discurso de ódio ou material explícito.",
              style: TextStyle(fontSize: 16, color: Tema.textColor),
            ),
            SizedBox(height: 5),
            Text(
              "3. Proibido spam ou publicidade não autorizada.",
              style: TextStyle(fontSize: 16, color: Tema.textColor),
            ),
            SizedBox(height: 5),
            Text(
              "4. Mantenha as discussões relacionadas ao tema dos jogos retrô.",
              style: TextStyle(fontSize: 16, color: Tema.textColor),
            ),
            SizedBox(height: 5),
            Text(
              "5. Use a função de busca antes de criar um novo tópico, para evitar duplicações.",
              style: TextStyle(fontSize: 16, color: Tema.textColor),
            ),
            SizedBox(height: 10),
            Text(
              "Lembre-se de que as violações dessas regras podem resultar em suspensão ou banimento do fórum.",
              style: TextStyle(fontSize: 16, color: Tema.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
