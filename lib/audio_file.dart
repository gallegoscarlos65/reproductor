import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  AudioFile({Key? key, required this.advancedPlayer}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  // final String path = AssetSource("assets/TheLazySong") as String;
  final String path = "assets/TheLazySong";

  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) {setState(() {
      _duration= d;
    }); });
    this.widget.advancedPlayer.onPositionChanged.listen((p) {setState(() {
      _position= p;
    }); });

    this.widget.advancedPlayer.setSourceUrl(path);
  }

  Widget btnStart(){
    return IconButton(
      onPressed: (){
        // this.widget.advancedPlayer.play(setSourceUrl(path));
    }, 
    icon: Icon(_icons[0]),
    padding: const EdgeInsets.only(bottom: 10),
    );
  }

  Widget loadAsset(){
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnStart(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

            ],
          ),),
          loadAsset(),
        ],
      ),
    );
  }
}