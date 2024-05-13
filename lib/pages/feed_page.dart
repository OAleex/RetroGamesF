import 'package:flutter/material.dart';
import 'package:retrogamesf/pages/create_discussion.page.dart';
import 'package:retrogamesf/shared/tema.dart';
import 'package:retrogamesf/pages/discussion_details.page.dart';
import 'package:retrogamesf/pages/login.page.dart';
import 'package:retrogamesf/pages/played_games.page.dart';
import 'package:retrogamesf/pages/osts.page.dart';
import 'package:retrogamesf/pages/profile.page.dart';
import 'package:retrogamesf/pages/chat.page.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> discussions = [
      {
        'title': 'Super Mario World',
        'status': true,
        'comments': [
          {
            'username': 'MarioFan',
            'comment': 'This level is super tough!',
            'emoji': '😤'
          },
          {
            'username': 'Luigi42',
            'comment': 'Totally stuck on the ghost house.',
            'emoji': '👻'
          },
        ],
      },
      {
        'title': 'Final Fantasy VI - Melhores Estratégias',
        'status': false,
        'comments': [
          {
            'username': 'TerraLover',
            'comment': 'Anyone tried the new glitch?',
            'emoji': '🤔'
          },
          {
            'username': 'LockeCole',
            'comment': 'Here’s a tip for getting past the empire!',
            'emoji': '💡'
          },
        ],
      },
    ];

    return Scaffold(
      backgroundColor: Tema.backgroundColor,
      appBar: AppBar(
        title:
            Text('Feed de Discussões', style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
            color: Colors.white), // Ajusta a cor da seta de retorno
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case 'profile':
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                  break;
                case 'playedGames':
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayedGamesPage()));
                  break;
                case 'osts':
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OSTsPage()));
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'profile',
                child: Text('Meu Perfil',
                    style: TextStyle(
                        color: Colors.white)), // Cor branca para o texto
              ),
              const PopupMenuItem<String>(
                value: 'playedGames',
                child: Text('Played Games',
                    style: TextStyle(
                        color: Colors.white)), // Cor branca para o texto
              ),
              const PopupMenuItem<String>(
                value: 'osts',
                child: Text('OSTs',
                    style: TextStyle(
                        color: Colors.white)), // Cor branca para o texto
              ),
            ],
            color: Tema.textoInputColor, // Define a cor do fundo do menu
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
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
              title: Text(discussion['title'] as String,
                  style: TextStyle(color: Tema.textColor)),
              trailing: Icon(
                  (discussion['status'] as bool)
                      ? Icons.check_circle_outline
                      : Icons.cancel,
                  color: (discussion['status'] as bool)
                      ? Colors.green
                      : Colors.red),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DiscussionDetailsPage(
                      title: discussion['title'] as String,
                      comments:
                          discussion['comments'] as List<Map<String, String>>,
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatPage()));
            },
            child: const Icon(Icons.chat),
            backgroundColor: Tema.corPrimeira,
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateDiscussionPage()));
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
