import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TexttoSpeech extends StatefulWidget {
  const TexttoSpeech({super.key});

  @override
  State<TexttoSpeech> createState() => _TexttoSpeechState();
}

class _TexttoSpeechState extends State<TexttoSpeech> {
   FlutterTts flutterTts = FlutterTts();
  TextEditingController textcontroller = TextEditingController();
 
  speak()async{
    await flutterTts.speak(textcontroller.text);
    flutterTts.setVolume(100.0);
    flutterTts.setLanguage('bn-IN');
    flutterTts.setVoice({"name": "", "locale": "bn-IN"});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text to Speech')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.stop_circle),
        onPressed: (){
          flutterTts.stop();
        }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: 
            const EdgeInsets.all(28.0),
            child: Center(
              child: TextField(
                controller: textcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,color: Colors.green
                    )
                  )
                ),
              )),
            ),
            ElevatedButton(onPressed: (){
              speak();
            }, child: const Icon(Icons.volume_up_outlined))
          ],
        ),
    );
  }
}