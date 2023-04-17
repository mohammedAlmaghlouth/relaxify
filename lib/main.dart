import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Relaxify',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'AmaticSC',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black54,
        ),
        body: const MusicApp(),
      ),
    ),
  );
}

class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  int number = 1;
  AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wp.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$number/6',
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'AmaticSC',
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        if (number != 1) {
                          number = number - 1;
                        }
                      },
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    AudioPlayer p = AudioPlayer();
                    await p.play(AssetSource('$number.mp3'));
                  },
                  child: Image.asset(
                    'images/$number.jpg',
                    width: 200,
                    height: 300,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        if (number != 6) {
                          number = number + 1;
                        }
                      },
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async {
                    AudioPlayer p = AudioPlayer();
                    await p.play(AssetSource('$number.mp3'));
                  },
                  child: const Text(
                    'Play',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'AmaticSC',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    AudioPlayer p = AudioPlayer();
                    await p.stop();
                  },
                  child: const Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'AmaticSC',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    AudioPlayer p = AudioPlayer();
                    await p.pause();
                  },
                  child: const Text(
                    'Pause',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'AmaticSC',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(
                      () {
                        number = Random().nextInt(6) + 1;
                      },
                    );
                  },
                  child: const Text(
                    'Shuffle',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'AmaticSC',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
