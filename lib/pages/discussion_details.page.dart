import 'package:flutter/material.dart';
import 'package:retrogamesf/shared/tema.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DiscussionDetailsPage extends StatefulWidget {
  final String title;
  final List<Map<String, String>> initialComments;

  const DiscussionDetailsPage({Key? key, required this.title, required this.initialComments, required List<Map<String, String>> comments}) : super(key: key);

  @override
  _DiscussionDetailsPageState createState() => _DiscussionDetailsPageState();
}

class _DiscussionDetailsPageState extends State<DiscussionDetailsPage> {
  List<Map<String, String>> _comments = [];
  TextEditingController _commentController = TextEditingController();
  String _selectedEmoji = '😀';
  final List<String> _emojis = ['😀', '😂', '😍', '😤', '👻', '💡'];

  @override
  void initState() {
    super.initState();
    _comments = List.from(widget.initialComments);
    _loadComments();
  }

  Future<void> _loadComments() async {
    final prefs = await SharedPreferences.getInstance();
    String savedData = prefs.getString('discussion_${widget.title}') ?? '[]';
    List<dynamic> savedComments = json.decode(savedData);
    setState(() {
      _comments.addAll(savedComments.map((e) => Map<String, String>.from(e)).toList());
    });
  }

  Future<void> _addComment() async {
    if (_commentController.text.isNotEmpty) {
      Map<String, String> newComment = {
        'username': 'Player 1',
        'comment': _commentController.text,
        'emoji': _selectedEmoji
      };
      _comments.add(newComment);
      await _saveComments();
      setState(() {
        _commentController.clear();
      });
    }
  }

  Future<void> _saveComments() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('discussion_${widget.title}', json.encode(_comments));
  }

  void _selectEmoji() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemCount: _emojis.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedEmoji = _emojis[index];
                    Navigator.pop(context);
                  });
                },
                child: Center(
                  child: Text(_emojis[index], style: TextStyle(fontSize: 24)),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Tema.backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  var comment = _comments[index];
                  return ListTile(
                    title: Text(comment['username']!, style: TextStyle(color: Tema.textColor)),
                    subtitle: Text(comment['comment']!, style: TextStyle(color: Tema.textColor.withOpacity(0.6))),
                    trailing: Text(comment['emoji']!, style: TextStyle(fontSize: 24)),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Text(_selectedEmoji, style: TextStyle(fontSize: 24)),
                    onPressed: _selectEmoji,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        labelText: 'Adicionar comentário',
                        labelStyle: TextStyle(color: Tema.textColor),
                        fillColor: Tema.textoInputColor,
                        filled: true,
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
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Tema.buttonColor),
                    onPressed: _addComment,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
