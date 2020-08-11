import 'package:flutter/material.dart';
import 'package:xylophone/Animal.dart';
import 'package:xylophone/AnimalCard.dart';

import 'package:xylophone/SoundPlayer.dart';
import 'package:xylophone/animals.dart';
import 'package:xylophone/getIt.dart';

// ignore: must_be_immutable
class AnimalsScreen extends StatelessWidget {
  List<Map<String, String>> _animals;
  SoundPlayer _soundPlayer;

  AnimalsScreen({
    Key key,
    animals,
    soundPlayer,
  }) {
    _soundPlayer = soundPlayer ?? AppGetIt<SoundPlayer>();
    _animals = animals ?? ANIMALS;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.volume_up),
        title: Text("Animals' sounds"),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          itemCount: _animals.length,
          itemBuilder: (BuildContext context, int key) {
            return AnimalCard(
              animal: Animal.fromMap(
                _animals[key],
              ),
              image: AssetImage(
                "assets/animals-images/${_animals[key]['slug']}.png",
              ),
              player: _soundPlayer,
            );
          },
          separatorBuilder: (BuildContext context, int key) {
            return SizedBox(
              height: 10.0,
            );
          },
        ),
      ),
    );
  }
}

// ListView.separated(
//           itemCount: _animals.length,
//           itemBuilder: (BuildContext context, int key) => AnimalCard(
//             animal: Animal.fromMap(
//               _animals[key],
//             ),
//             image: AssetImage(
//               "assets/animals-images/${_animals[key]['slug']}.png",
//             ),
//             player: _soundPlayer,
//           ),
//           separatorBuilder: (BuildContext context, int key) => SizedBox(
//             height: 10.0,
//           ),
//         )
