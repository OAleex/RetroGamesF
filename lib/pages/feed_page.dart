import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:retrogamesf/pages/rule.page.dart';
import 'package:retrogamesf/shared/tema.dart';
import 'package:retrogamesf/pages/discussion_details.page.dart';
import 'package:retrogamesf/pages/login.page.dart';
import 'package:retrogamesf/pages/played_games.page.dart';
import 'package:retrogamesf/pages/profile.page.dart';
import 'package:retrogamesf/pages/chat.page.dart';
import 'package:retrogamesf/pages/create_discussion.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Map<String, dynamic>> discussions = [];

  @override
  void initState() {
    super.initState();
    loadDiscussions();
  }

  Future<void> loadDiscussions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? discussionsJson = prefs.getString('discussions');
    if (discussionsJson != null) {
      setState(() {
        discussions = List<Map<String, dynamic>>.from(json.decode(discussionsJson));
      });
    }
  }

  Future<void> saveDiscussions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('discussions', json.encode(discussions));
  }

  void addDiscussion(String title) {
    setState(() {
      discussions.add({'title': title});
      saveDiscussions();
    });
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tema.backgroundColor,
      appBar: AppBar(
        title: Text('Feed de Discussões', style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case 'profile':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                  break;
                case 'playedGames':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlayedGamesPage()));
                  break;
                case 'regrasList':
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RulesPage()));
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(value: 'profile', child: Text('Meu Perfil', style: TextStyle(color: Colors.white))),
              const PopupMenuItem<String>(value: 'playedGames', child: Text('Minha Lista', style: TextStyle(color: Colors.white))),
              const PopupMenuItem<String>(value: 'regrasList', child: Text('Regras', style: TextStyle(color: Colors.white))),
            ],
            color: Tema.textoInputColor,
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: discussions.length,
        itemBuilder: (context, index) {
          final discussion = discussions[index];
          return Card(
            color: Tema.textoInputColor,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(discussion['title'] as String, style: TextStyle(color: Tema.textColor)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiscussionDetailsPage(
                      title: discussion['title'] as String,
                      initialComments: [],
                      comments: [],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
            },
            child: const Icon(Icons.chat),
            backgroundColor: Tema.corPrimeira,
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateDiscussionPage(
                onCreateDiscussion: addDiscussion,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Tema.corPrimeira,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
