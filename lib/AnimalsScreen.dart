import 'package:flutter/material.dart';
import 'package:xylophone/Animal.dart';
import 'package:xylophone/AnimalCard.dart';

import 'package:xylophone/SoundPlayer.dart';
import 'package:xylophone/animals.dart';
import 'package:xylophone/getIt.dart';

class AnimalsScreen extends StatelessWidget {
  List<Map<String, String>> _animals;
  SoundPlayer _soundPlayer;

  AnimalsScreen({
    Key key,
    animals,
    soundPlayer,
  }) : super(key: key) {
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
          itemCount: _animals.length,
          itemBuilder: (BuildContext context, int key) => AnimalCard(
            animal: Animal.fromMap(
              _animals[key],
            ),
            image: AssetImage(
              "assets/animals-images/${_animals[key]['slug']}.png",
            ),
            player: _soundPlayer,
          ),
          separatorBuilder: (BuildContext context, int key) => SizedBox(
            height: 10.0,
          ),
        ),
      ),
    );
  }
}
