import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../../core/constants/app_colors.dart';

class VoiceSearchModal extends StatefulWidget {
  const VoiceSearchModal({super.key});

  @override
  State<VoiceSearchModal> createState() => _VoiceSearchModalState();
}

class _VoiceSearchModalState extends State<VoiceSearchModal> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  String _currentStatus = "Initializing...";

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// Initialize speech recognition
  void _initSpeech() async {
    try {
      _speechEnabled = await _speechToText.initialize(
        onStatus: (status) => setState(() => _currentStatus = status),
        onError: (errorNotification) => print('Error: $errorNotification'),
      );

      if (_speechEnabled) {
        _startListening();
      } else {
        setState(() => _currentStatus = "Permission Denied");
      }
    } catch (e) {
      setState(() => _currentStatus = "Error initializing");
    }
  }

  void _startListening() async {
    await _speechToText.listen(
      onResult: _onSpeechResult,
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 5),
      partialResults: true, // This ensures text updates as you speak
    );
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });

    if (result.finalResult) {
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) Navigator.pop(context, _lastWords);
      });
    }
  }

  @override
  void dispose() {
    _speechToText.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Visual feedback for the Mic
            _buildMicAnimation(),

            const SizedBox(height: 20),
            Text(
              _speechToText.isListening ? "Listening..." : "Try saying something...",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              ),
            ),
            const SizedBox(height: 10),

            // Real-time Text Display
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _lastWords.isEmpty
                    ? "Example: '5 KG ATTA or FRESH TAMATAR'"
                    : _lastWords,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _lastWords.isEmpty ? Colors.grey : Colors.black,
                  fontSize: 16,
                  fontWeight: _lastWords.isEmpty ? FontWeight.normal : FontWeight.w500,
                  fontStyle: _lastWords.isEmpty ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildMicAnimation() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // You could use a TweenAnimationBuilder here for a real pulse
        CircleAvatar(
          radius: 45,
          backgroundColor: AppColors.primaryRed.withOpacity(0.1),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.primaryRed,
            child: const Icon(Icons.mic, color: Colors.white, size: 40),
          ),
        ),
      ],
    );
  }
}