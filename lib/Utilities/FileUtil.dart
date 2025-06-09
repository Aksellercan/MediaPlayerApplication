import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

String library_Path = "";
String currentOS = "";
List mediaList = List.empty(growable: true);

bool doesFolderExist(String path) {
  return true;
}

String getOS() {
  if (Platform.isAndroid) {
    return "Android";
  } else if (Platform.isIOS) {
    return "iOS";
  }
  return "Unknown OS";
}

Future<void> setlibrary_Path() async {
  currentOS = getOS();
  if (currentOS == "Android") {
      // Ask for storage permission first
      var status = await Permission.manageExternalStorage.request();
      if (status.isGranted) {
        final publicMusicDir = Directory("/sdcard/Music");
        if (await publicMusicDir.exists()) {
          library_Path = publicMusicDir.path;
        } else {
          print("Public music folder not found!");
          makeFolders();
        }
        } else if (status.isPermanentlyDenied) {
          openAppSettings();
        }
    } else if (currentOS == "iOS") {
      library_Path = (await getApplicationDocumentsDirectory()).path;
    } else {
      print("Unsupported platform: $currentOS");
      return;
    }
    if (library_Path == "" || library_Path.isEmpty) {
      print("Library path is empty, check your permissions or platform support.");
      return;
    }
  print("Library Path: $library_Path");
}

Future<bool> doesFileExist() async {
  final path = '${getLibraryPath}/test1.mp3';
  final file = File(path);
  if (!await file.exists ()) {
  print('❌ File NOT found at: $path');
  return false;
  }
  print('✅ Found file: $path');
  return true;
}

get getLibraryPath {
  return library_Path;
}

get getMediaList {
  return mediaList;
}

void makeFolders(){

}

void writeFiles() {}

void readFiles() {
  mediaList = Directory(library_Path).listSync().where((item) => item.path.endsWith('.mp3')).toList();
}