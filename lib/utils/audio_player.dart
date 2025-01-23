import 'package:assets_audio_player/assets_audio_player.dart';

final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

Future<void> playSuccessAudio() async {
  try {
    await _audioPlayer.open(
      Audio("assets/audio/wow.mp3"),
      autoStart: true,
    );
    Future.delayed(Duration(seconds: 10), () {
      _audioPlayer.stop();
    });
  } catch (e) {
    print("오디오 재생에 실패했습니다: $e");
  }
}
