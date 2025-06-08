class Media {
  String title;
  int duration;
  int position;
  DateTime addedAt;
  Media({
    required this.position,
    required this.title,
    required this.duration,
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
  set setPosition(int position) {
    this.position = position;
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
  int get getPosition{
    return position;
  }
  //toString method
  @override
  String toString() {
    return 'Media(title: $title, duration: $duration, addedAt: $addedAt)';
  }
}