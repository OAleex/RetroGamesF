import 'package:flutter/material.dart';
import 'package:retrogamesf/models/game.model.dart';
import 'package:retrogamesf/shared/tema.dart';

class PlayedGamesPage extends StatelessWidget {
  PlayedGamesPage({Key? key}) : super(key: key);

  final List<Game> games = [
    Game(
      id: 1,
      title: "Crash Bandicoot",
      platform: "PlayStation",
      releaseDate: DateTime(1996, 9, 9),
      description: "Um clássico da Naughty Dog.",
      userRating: 5.0,
      userComment: "Amo muito, bem nostálgico.",
    ),
    Game(
      id: 2,
      title: "Super Mario World",
      platform: "SNES",
      releaseDate: DateTime(1990, 11, 21),
      description: "Um dos melhores jogos de plataforma já feitos.",
      userRating: 5.0,
      userComment: "Obra-prima!",
    ),
    Game(
      id: 3,
      title: "Final Fantasy VII",
      platform: "PlayStation",
      releaseDate: DateTime(1997, 1, 31),
      description: "Um RPG marcante da Square Enix.",
      userRating: 5.0,
      userComment: "Enredo épico e jogabilidade envolvente.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha lista', style: TextStyle(color: Tema.textColor)),
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
