class Media {
  String title;
  String path;
  int duration;
  DateTime addedAt;
  Media({
    required this.title,
    required this.duration,
    required this.path,
    required this.addedAt,
  });
  //setters
  set setTitle(String title) {
    this.title = title;
  }
  set setDuration(int duration) {
    this.duration = duration;
  }
  set setAddedAt(DateTime addedAt) {
    this.addedAt = addedAt;
  }
  set setPath(String path) {
    this.path = path;
  }
  //getters
  String get getTitle {
    return title;
  }
  int get getDuration {
    return duration;
  }
  DateTime get getAddedAt {
    return addedAt;
  }
  String get getPath {
    return path;
  }
  //toString method
  @override
  String toString() {
    return 'Media(title: $title, duration: $duration, addedAt: $addedAt)';
  }
}