class Course {
  final String id;
  final String title;
  final String imageUrl;

  Course({required this.id, required this.title, required this.imageUrl});

  factory Course.fromJson(Map<String, dynamic> json) =>
      Course(id: json['id'], title: json['title'], imageUrl: json['imageUrl']);
}
