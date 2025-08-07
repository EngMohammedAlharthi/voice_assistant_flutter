import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const VoiceChatBotApp());
}

class VoiceChatBotApp extends StatelessWidget {
  const VoiceChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Chatbot',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F0F9),
        useMaterial3: true,
      ),
      home: const VoiceChatPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VoiceChatPage extends StatefulWidget {
  const VoiceChatPage({super.key});

  @override
  State<VoiceChatPage> createState() => _VoiceChatPageState();
}

class _VoiceChatPageState extends State<VoiceChatPage> {
  late stt.SpeechToText _speech;
  late FlutterTts _flutterTts;

  String userText = 'Tap the mic to speak';
  String botReply = '';
  bool isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _flutterTts = FlutterTts();
  }

  Future<void> _listen() async {
    if (!isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => isListening = true);
        _speech.listen(
          onResult: (result) {
            setState(() {
              userText = result.recognizedWords;
            });
            _getBotReply(userText);
          },
        );
      }
    } else {
      setState(() => isListening = false);
      _speech.stop();
    }
  }

  Future<void> _getBotReply(String input) async {
    setState(() => botReply = 'Processing...');

    await Future.delayed(const Duration(seconds: 2)); // simulate response delay
    final reply = 'You said: $input';

    setState(() => botReply = reply);
    await _flutterTts.speak(reply);
  }

  @override
  void dispose() {
    _speech.stop();
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Chatbot'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mic, size: 80, color: isListening ? Colors.red : Colors.deepPurple),
              const SizedBox(height: 30),
              Text('You said:', style: Theme.of(context).textTheme.titleMedium),
              Text(userText, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 30),
              Text('Bot says:', style: Theme.of(context).textTheme.titleMedium),
              Text(botReply, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _listen,
                icon: const Icon(Icons.mic),
                label: Text(isListening ? 'Listening...' : 'Speak'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}