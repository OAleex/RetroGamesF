import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:retrogamesf/shared/tema.dart';

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
        title: Text("Chat Global", style: TextStyle(color: Tema.textColor)),
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
                    alignment: index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Tema.corPrimeira,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Text(_messages[index], style: TextStyle(color: Tema.textColor, fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Tema.textoInputColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.0),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, -3),
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _messageController,
                style: TextStyle(color: Tema.textColor),
                decoration: InputDecoration(
                  hintText: "Digite sua mensagem",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send, color: Tema.corPrimeira),
                    onPressed: _sendMessage,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
