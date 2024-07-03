// import 'package:basiccom/src/features/customisation/data/data_sources/local/customisation_local_data_source.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'tts_provider.g.dart';

// @Riverpod(keepAlive: true)
// class AppTTS extends _$AppTTS {
//   final prefs = UserPreferences();
//   @override
//   FlutterTts build() => FlutterTts();

//   Future<void> initTTS() async {
//     state.setLanguage("es-US");
//     await state.setVolume(prefs.volume);
//     await state.setPitch(prefs.pitch);
//     await state.setSpeechRate(prefs.rate);
//   }

//   Future<void> speak(String text) async {
//     final appConfig = ref.watch(configProvider);
//     await state.setVolume(appConfig.ttsVolume);
//     await state.setPitch(appConfig.ttsPitch);
//     await state.setSpeechRate(appConfig.ttsRate);
//     await state.speak(text);
//   }
// }

