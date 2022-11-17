class Event {
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String type;

  Event(
    this.title,
    this.description,
    this.startTime,
    this.endTime,
    this.type,
  );
}

class Lecturer {
  final String name;
  final String description;
  final String image;

  Lecturer(
    this.name,
    this.description,
    this.image,
  );
}

class Organizer {
  final String name;
  final String title;

  Organizer(
    this.name,
    this.title,
  );
}
