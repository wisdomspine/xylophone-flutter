import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xylophone/AnimalsScreen.dart';
import 'package:xylophone/getIt.dart';

void main() {
  setGetIt();
  runApp(AnimalsSounds());
}

class AnimalsSounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnimalsScreen(),
    );
  }
}

// class XylophoneApp extends StatelessWidget {
//   final List<Color> _colors = [
//     Colors.red,
//     Colors.orange,
//     Colors.yellow,
//     Colors.green,
//     Colors.blue,
//     Colors.indigo,
//     Color(0xFFEE82EE)
//   ];
//   List<AudioCache> _players;

//   XylophoneApp() {
//     _players = _colors
//         .map(
//           (e) => AudioCache(prefix: "notes/"),
//         )
//         .toList();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: _colors
//                 .asMap()
//                 .map(
//                   (key, value) => MapEntry(
//                     key,
//                     Expanded(
//                       child: FlatButton(
//                         color: _colors[key],
//                         onPressed: () {
//                           playNote(key + 1);
//                         },
//                       ),
//                     ),
//                   ),
//                 )
//                 .values
//                 .toList(),
//           ),
//         ),
//       ),
//     );
//   }

//   void playNote(int noteNumber) {
//     _players[noteNumber].play(
//       "note$noteNumber.wav",
//       mode: PlayerMode.MEDIA_PLAYER,
//     );
//   }
// }
