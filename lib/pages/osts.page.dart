import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:retrogamesf/shared/tema.dart'; // Certifique-se de importar o Tema

class OSTsPage extends StatefulWidget {
  const OSTsPage({Key? key}) : super(key: key);

  @override
  _OSTsPageState createState() => _OSTsPageState();
}

class _OSTsPageState extends State<OSTsPage> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  String? currentPlaying;

  List<Map<String, dynamic>> tracks = [
    {
      'title': 'Crash Bandicoot',
      'audio': 'assets/audio/crash_bandicoot.mp3',
    },
    {
      'title': 'Super Mario',
      'audio': 'assets/audio/super_mario.mp3',
    },
    {
      'title': 'Pepsiman',
      'audio': 'assets/audio/pepsiman.mp3',
    },
    {
      'title': 'Final Fantasy VII',
      'audio': 'assets/audio/final_fantasy_vii.mp3',
    },
  ];

  void _playTrack(String trackPath) async {
    if (currentPlaying == trackPath && isPlaying) {
      await player.pause();
      setState(() {
        isPlaying = false;
        currentPlaying = null; // Quando parar, limpa a música atual
      });
    } else {
      if (currentPlaying != null && isPlaying) {
        // Se uma música estiver tocando e for diferente da atual, pare a atual antes de iniciar outra
        await player.pause();
      }
      await player.play(AssetSource(trackPath));
      setState(() {
        isPlaying = true;
        currentPlaying = trackPath; // Definindo a música atual que está tocando
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OSTs', style: TextStyle(color: Tema.textColor)),
        backgroundColor: Tema.corPrimeira,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Tema.backgroundColor, // Aplicando a cor de fundo corretamente
        child: ListView.builder(
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            return Card(
              color: Tema.textoInputColor, // Usando a cor do botão para o fundo dos itens
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(tracks[index]['title'], style: TextStyle(color: Tema.textColor)),
                trailing: IconButton(
                  icon: Icon(currentPlaying == tracks[index]['audio'] && isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () => _playTrack(tracks[index]['audio']),
                  color: Tema.textColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
