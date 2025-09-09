class Teacher {
  final String id;
  final String name;
  final double rating;
  final String imageUrl;

  Teacher({
    required this.id,
    required this.name,
    required this.rating,
    required this.imageUrl,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    id: json['id'],
    name: json['name'],
    rating: (json['rating'] as num).toDouble(),
    imageUrl: json['imageUrl'],
  );
}
