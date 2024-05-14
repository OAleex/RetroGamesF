import 'package:flutter/material.dart';
import 'package:retrogamesf/shared/tema.dart';

class CreateDiscussionPage extends StatelessWidget {
  final Function(String) onCreateDiscussion;
  final TextEditingController _titleController = TextEditingController();

  CreateDiscussionPage({Key? key, required this.onCreateDiscussion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Discussão", style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Tema.backgroundColor,
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  onCreateDiscussion(_titleController.text);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Tema.buttonColor,
                foregroundColor: Tema.buttonTextColor,
              ),
              child: Text("Postar Discussão"),
            )
          ],
        ),
      ),
    );
  }
}
