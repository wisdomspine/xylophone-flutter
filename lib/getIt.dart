import 'package:get_it/get_it.dart';
import 'package:xylophone/SoundPlayer.dart';

final AppGetIt = GetIt.instance;
void setGetIt({
  String SoundPlayerPrefix = "animals-sounds/",
  String SoundPlayerExt = ".mp3",
}) {
  AppGetIt.registerSingleton<SoundPlayer>(
    SoundPlayer(prefix: SoundPlayerPrefix, ext: SoundPlayerExt),
  );
}
