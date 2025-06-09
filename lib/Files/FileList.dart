import 'package:media_player_application/Utilities/FileUtil.dart' as FileUtil;

List mediaList = FileUtil.getMediaList;

void printList() {
  if (mediaList.isEmpty) {
    print("Media list is empty.");
  } else {
    print("Media List:");
    int count = 1;
    for (var item in mediaList) {
      print("TEST!@# $count ${item.toString()}");
      count++;
    }
  }
}