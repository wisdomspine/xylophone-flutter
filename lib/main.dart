import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Color(0xFFEE82EE)
  ];
  List<AudioCache> _players;

  XylophoneApp() {
    _players = _colors
        .map(
          (e) => AudioCache(prefix: "notes/"),
        )
        .toList();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int key) => Container(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                child: FlatButton(
                  color: _colors[key],
                  onPressed: () {
                    _players[key].play(
                      "note${key + 1}.wav",
                      mode: PlayerMode.MEDIA_PLAYER,
                    );
                  },
                  child: null,
                ),
                width: 100,
                height: 50,
              ),
            ),
            separatorBuilder: (BuildContext context, int key) => SizedBox(
              height: 10.0,
            ),
            itemCount: _colors.length,
          ),
        ),
      ),
    );
  }
}
