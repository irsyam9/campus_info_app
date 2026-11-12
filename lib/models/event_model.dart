class Event {
  const Event({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.speaker,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: (json['id'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      category: (json['category'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      date: (json['date'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      imageUrl: (json['imageUrl'] as String?) ?? '',
      speaker: (json['speaker'] as String?) ?? '',
    );
  }

  final String id;
  final String title;
  final String category;
  final String description;
  final String date;
  final String location;
  final String imageUrl;
  final String speaker;
}