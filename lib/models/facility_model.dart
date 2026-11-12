class Facility {
  const Facility({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.location,
    required this.imageUrl,
    required this.operatingHours,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      category: (json['category'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      imageUrl: (json['imageUrl'] as String?) ?? '',
      operatingHours: (json['operatingHours'] as String?) ?? '',
    );
  }

  final String id;
  final String name;
  final String category;
  final String description;
  final String location;
  final String imageUrl;
  final String operatingHours;
}