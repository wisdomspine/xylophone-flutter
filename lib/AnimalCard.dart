import 'dart:async';

import 'package:flutter/material.dart';
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
  _AnimalCardState createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard> {
  bool _isPlaying;
  StreamSubscription<Animal> _playerSubscription;

  _AnimalCardState() {
    _playerSubscription = widget.player.player.listen((event) {
      _isPlaying = widget.animal == event ? true : false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image(
            image: widget.image,
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.center,
            heightFactor: 1,
            child: Text(
              widget.animal.name.toUpperCase(),
            ),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: "Sound: ",
                  children: [
                    TextSpan(text: widget.animal.sound),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              _isPlaying
                  ? RaisedButton(
                      onPressed: () {
                        widget.player.stop();
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
                        widget.player.play(widget.animal);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Text("Play sound"),
                      color: Theme.of(context).colorScheme.secondary,
                    )
            ],
          )
        ],
      ),
    );
  }

  void dispose() {
    _playerSubscription.cancel();
    super.dispose();
  }
}
