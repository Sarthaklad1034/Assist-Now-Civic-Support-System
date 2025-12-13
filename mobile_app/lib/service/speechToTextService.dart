// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
//
// class speechToTextService {
//   final stt.SpeechToText _speech = stt.SpeechToText();
//
//   Future<bool> init() async {
//     bool available = await _speech.initialize(
//       onStatus: (status) => print('Status: $status'),
//       onError: (error) => print('Error: $error'),
//     );
//     Fluttertoast.showToast(msg: 'Available: $available',
//
//     );
//
//     return available;
//   }
//
//   Future<void> listen({
//     required Function(String text) onResult,
//     required Function() onDone,
//     required Function(String err) onError,
//   }) async {
//     if (!_speech.isAvailable) {
//       onError("Speech recognition not available");
//       return;
//     }
//
//     await _speech.listen(
//       onResult: (res) {
//         onResult(res.recognizedWords);
//         if (res.finalResult) {
//           onDone();
//         }
//       },
//       listenFor: const Duration(seconds: 30),
//       pauseFor: const Duration(seconds: 3),
//       cancelOnError: true,
//       localeId: 'en_US',
//     );
//   }
//
//   Future<void> stop() async {
//     await _speech.stop();
//   }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class speechToTextService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<bool> init() async {
    if (_isInitialized) return true;

    try {
      bool available = await _speech.initialize(
        onStatus: (status) => debugPrint('Speech Status: $status'),
        onError: (error) => debugPrint('Speech Error: $error'),
      );

      _isInitialized = available;

      if (!available) {
        Fluttertoast.showToast(
          msg: 'Speech recognition not available on this device',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }

      return available;
    } catch (e) {
      debugPrint('Speech initialization error: $e');
      Fluttertoast.showToast(
        msg: 'Failed to initialize speech recognition',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return false;
    }
  }

  Future<void> listen({
    required Function(String text) onResult,
    required Function() onDone,
    required Function(String err) onError,
  }) async {
    if (!_isInitialized) {
      onError("Speech recognition not initialized");
      return;
    }

    if (!_speech.isAvailable) {
      onError("Speech recognition not available");
      return;
    }

    try {
      await _speech.listen(
        onResult: (res) {
          onResult(res.recognizedWords);
          if (res.finalResult) {
            onDone();
          }
        },
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 3),
        cancelOnError: true,
        partialResults: true, // Show results as you speak
        localeId: 'en_US',
      );
    } catch (e) {
      onError('Failed to start listening: $e');
    }
  }

  Future<void> stop() async {
    if (_speech.isListening) {
      await _speech.stop();
    }
  }

  bool get isListening => _speech.isListening;

  void dispose() {
    _speech.stop();
  }
}