import 'package:flutter/material.dart';
import 'package:retrogamesf/shared/tema.dart';

class CreateDiscussionPage extends StatelessWidget {
  const CreateDiscussionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Discussão", style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Tema.backgroundColor, // Define a cor de fundo para todo o body
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Título",
                labelStyle: TextStyle(color: Tema.textColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Tema.borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Tema.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Tema.buttonColor),
                ),
              ),
              style: TextStyle(color: Tema.textColor),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: "Conteúdo",
                labelStyle: TextStyle(color: Tema.textColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Tema.borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Tema.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Tema.buttonColor),
                ),
              ),
              style: TextStyle(color: Tema.textColor),
              maxLines: 6,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode adicionar a lógica para salvar a discussão no backend ou localmente
                // Após salvar, retornar para a página de feed
                Navigator.pop(context);  // Retorna à página anterior (FeedPage, se foi empilhada sobre esta)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Tema.buttonColor, // Cor de fundo do botão
                foregroundColor: Tema.buttonTextColor, // Cor do texto do botão
              ),
              child: Text("Postar Discussão"),
            )
          ],
        ),
      ),
    );
  }
}
