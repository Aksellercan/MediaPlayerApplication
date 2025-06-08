import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/PlayerWidget.dart';
import 'package:flutter/material.dart';
import 'package:media_player_application/Utilities/FileUtil.dart';

class SimpleExampleApp extends StatefulWidget {
  const SimpleExampleApp();

  @override
  _SimpleExampleAppState createState() => _SimpleExampleAppState();
}

class _SimpleExampleAppState extends State<SimpleExampleApp> {
  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    setlibrary_Path();

    //print("\nHELLOHELOO ${getLibraryPath()}\n}");

    // Create the audio player.
    player = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //await player.setSource(AssetSource('ambient_c_motion.mp3'));
      // await player.setSource(getLibraryPath() + "/test.mp3");
      print("\nHELLOHELOO33232 ${await doesFileExist()}\n");


      await player.setSource(DeviceFileSource("/sdcard/Music/test.mp3"));
      await player.resume();
    });
  }
  @override
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple MP3 Player'),
      ),
      backgroundColor: Colors.black26,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        Text(
        'Now Playing ${player.playerId}',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      PlayerWidget(player: player),
        ],
      ),
    );
  }
}