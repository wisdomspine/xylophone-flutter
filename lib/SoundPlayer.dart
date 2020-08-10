import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:xylophone/Animal.dart';

class SoundPlayer {
  BehaviorSubject<Animal> _subject;
  AudioCache _audioCache;
  final String ext;
  SoundPlayer({@required prefix, @required this.ext}) {
    _subject = BehaviorSubject.seeded(null);
    _audioCache = AudioCache(prefix: prefix, fixedPlayer: AudioPlayer());
  }

  void play(Animal animal) {
    _audioCache.fixedPlayer.stop();
    _audioCache.play("animal.slug$ext");
    _subject.add(animal);
  }

  void stop() {
    _subject.add(null);
  }

  Stream get player => _subject.stream;
}
