import 'package:flutter/material.dart';
import 'package:frontend/widgets/coolButtion.dart';
import 'package:frontend/widgets/coolText.dart';
import 'package:sentiment_dart/sentiment_dart.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class defender extends StatefulWidget {
  defender({Key? key}) : super(key: key);

  @override
  _defender createState() => _defender();
}

class _defender extends State<defender> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  late Map results;
  late bool ERROR;
  late String whatError;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
      results = {
        "score": Sentiment.analysis(_lastWords).score.toString(),
        "good": Sentiment.analysis(_lastWords).words.good.toString(),
        "bad": Sentiment.analysis(_lastWords).words.bad.toString(),
        "comparative": Sentiment.analysis(_lastWords).comparative.toString(),
      };
      ERROR = false;
    } catch (error) {
      results = {
        "score": 0.toString(),
        "good": "empty",
        "bad": "empty",
        "comparative": 0.toString(),
        "error": error.toString(),
      };
      ERROR = true;
      whatError = error.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: coolText(
          text: 'Defender',
          fontSize: 20,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    // If listening is active show the recognized words
                    _speechToText.isListening
                        ? _lastWords
                        // If listening isn't active but could be tell the user
                        // how to start it, otherwise indicate that speech
                        // recognition is not yet ready or not supported on
                        // the target device
                        : _speechEnabled
                            ? _lastWords
                            : 'Please Go To Setting And Change Permissions',
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            ERROR
                ? SizedBox(
                    width: 200,
                    child: Text(
                      "Status: $whatError",
                      textAlign: TextAlign.center,
                    ))
                : const SizedBox(
                    width: 200,
                    child: Text("Status: OK", textAlign: TextAlign.center)),
            const Spacer(),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 200,
                  child: coolText(
                    text: "Good Words : ${results['good']}\n\n"
                        "Bad Words : ${results['bad']}\n",
                    fontSize: 8,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 1,
              child: Text(
                'score: ${results["score"]}',
              ),
            ),
            ExpandedButton(
                onPressed: _speechToText.isNotListening
                    ? _startListening
                    : _stopListening,
                text: _speechToText.isNotListening ? "Start" : "Stop",
                flex: 1,
                fontSize: 20,
                width: 200),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
