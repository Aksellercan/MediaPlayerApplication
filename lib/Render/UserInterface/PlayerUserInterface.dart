import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/PlayerWidget.dart';
import 'package:media_player_application/Files/FileList.dart' as Loop;
import 'package:media_player_application/Utilities/FileUtil.dart';

class SimpleExampleApp extends StatefulWidget {
  const SimpleExampleApp();

  @override
  _SimpleExampleAppState createState() => _SimpleExampleAppState();
}

class _SimpleExampleAppState extends State<SimpleExampleApp> {
  late AudioPlayer player = AudioPlayer();
  List mediaList = [];

  @override
  void initState() {
    super.initState();

    // Create the audio player.
    player = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Set the library path based on the current OS.
      await setlibrary_Path();
      readFiles();
      Loop.printList();
      await doesFileExist();
      setState(() {
        mediaList = getMediaList;
      });
      //await player.setSource(AssetSource('ambient_c_motion.mp3'));
      //await player.setSource(DeviceFileSource(getLibraryPath + "/test.mp3"));
      //await player.resume(); //Start playback immediately
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
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Simple MP3 Player')
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mediaList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.music_note, color: Colors.orangeAccent),
                  title: Text(mediaList[index].toString()),
                  textColor: Colors.white,
                  onTap: () async {

                    // Set the source to the selected file.
                    await player.setSource(
                      DeviceFileSource(mediaList[index].path),
                    );
                    await player.resume();
                  },
                );
              },
            ),
          ),
          Container(
            color: Colors.orange,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Now Playing ${player.playerId}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                PlayerWidget(player: player),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
