import 'package:flutter/material.dart';
import 'package:retrogamesf/shared/tema.dart';  // Garanta que Tema está importado corretamente

class DiscussionDetailsPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> comments;

  const DiscussionDetailsPage({Key? key, required this.title, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Tema.backgroundColor,  // Define a cor de fundo para todo o body
        child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            var comment = comments[index];
            return ListTile(
              title: Text(comment['username']!, style: TextStyle(color: Tema.textColor)),
              subtitle: Text(comment['comment']!, style: TextStyle(color: Tema.textColor.withOpacity(0.6))),
              trailing: Text(comment['emoji']!, style: TextStyle(color: Tema.textColor)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Tema.backgroundColor,
                    title: Text('Perfil de ' + comment['username']!, style: TextStyle(color: Tema.textColor)),
                    content: Text('Avaliação: ' + comment['emoji']!, style: TextStyle(color: Tema.textColor)),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Fechar', style: TextStyle(color: Tema.buttonColor)),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
