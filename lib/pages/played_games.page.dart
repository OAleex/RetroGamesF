import 'package:flutter/material.dart';
import 'package:retrogamesf/models/game.model.dart';
import 'package:retrogamesf/shared/tema.dart'; // Certifique-se de que Tema está importado corretamente

class PlayedGamesPage extends StatelessWidget {
  PlayedGamesPage({Key? key}) : super(key: key);

  final List<Game> games = [
    Game(
      id: 1,
      title: "Crash Bandicoot",
      platform: "PlayStation",
      releaseDate: DateTime(1996, 9, 9),
      description: "A classic action platformer from Naughty Dog.",
      userRating: 5.0,
      userComment: "Loved it, very nostalgic!",
    ),
    Game(
      id: 2,
      title: "Super Mario World",
      platform: "SNES",
      releaseDate: DateTime(1990, 11, 21),
      description: "One of the best platform games ever made.",
      userRating: 5.0,
      userComment: "A timeless masterpiece!",
    ),
    Game(
      id: 3,
      title: "Final Fantasy VII",
      platform: "PlayStation",
      releaseDate: DateTime(1997, 1, 31),
      description: "A landmark RPG by Square Enix.",
      userRating: 5.0,
      userComment: "Epic storyline and deep gameplay.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Played Games', style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Tema.backgroundColor,
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          Game game = games[index];
          return Card(
            color: Tema.textoInputColor,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(game.title, style: TextStyle(color: Tema.textColor)),
              subtitle: Text("${game.platform} - ${game.releaseDate.year}", style: TextStyle(color: Tema.textColor)),
              trailing: Text("${game.userRating} ⭐", style: TextStyle(color: Tema.textColor)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Tema.backgroundColor,
                    title: Text(game.title, style: TextStyle(color: Tema.textColor)),
                    content: SingleChildScrollView(
                      child: Text(game.description, style: TextStyle(color: Tema.textColor)),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Close', style: TextStyle(color: Tema.textColor)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
