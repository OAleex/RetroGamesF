import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:retrogamesf/shared/tema.dart';  // Garanta que Tema está importado corretamente

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _messages = prefs.getStringList('messages') ?? [];
    });
  }

  Future<void> _saveMessage(String message) async {
    final prefs = await SharedPreferences.getInstance();
    _messages.add(message);
    await prefs.setStringList('messages', _messages);
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _saveMessage(_messageController.text);
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tema.backgroundColor,
      appBar: AppBar(
        title: Text("Chat", style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Tema.corPrimeira,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(_messages[index], style: TextStyle(color: Tema.textColor, fontSize: 19)), // Aumentado tamanho do texto
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: _messageController,
              style: TextStyle(color: Tema.textColor), // Cor do texto digitado
              decoration: InputDecoration(
                filled: true,
                fillColor: Tema.backgroundColor,
                hintText: "Type a message",
                hintStyle: TextStyle(color: Colors.grey[400]), // Cor mais clara para o hint
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send, color: Tema.corPrimeira),
                  onPressed: _sendMessage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
