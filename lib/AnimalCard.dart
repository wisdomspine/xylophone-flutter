import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xylophone/Animal.dart';
import 'package:xylophone/SoundPlayer.dart';

class AnimalCard extends StatefulWidget {
  final Animal animal;
  final ImageProvider image;
  final SoundPlayer player;
  AnimalCard({
    @required this.animal,
    @required this.image,
    @required this.player,
  });
  @override
  _AnimalCardState createState() =>
      _AnimalCardState(animal: animal, image: image, player: player);
}

class _AnimalCardState extends State<AnimalCard> {
  bool _isPlaying;
  final Animal animal;
  final ImageProvider image;
  final SoundPlayer player;
  StreamSubscription<Animal> _playerSubscription;

  _AnimalCardState({
    @required this.animal,
    @required this.image,
    @required this.player,
  }) {
    _isPlaying = false;
    _playerSubscription = player.player.listen((event) {
      _isPlaying = animal == event ? true : false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Image(
              image: image,
              fit: BoxFit.contain,
            ),
            Align(
              alignment: Alignment.center,
              heightFactor: 1,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  animal.name.toUpperCase(),
                  style: GoogleFonts.indieFlower(
                    textStyle: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Sound: ",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      TextSpan(
                        text: animal.sound,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                _isPlaying
                    ? RaisedButton(
                        onPressed: () {
                          player.stop();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Text("Stop"),
                        color: Theme.of(context).buttonColor,
                      )
                    : RaisedButton(
                        onPressed: () {
                          player.play(widget.animal);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: Text("Play sound"),
                        textColor: Colors.white,
                        color: Theme.of(context).colorScheme.secondary,
                      )
              ],
            )
          ],
        ),
      ),
    );
  }

  void dispose() {
    _playerSubscription.cancel();
    super.dispose();
  }
}
