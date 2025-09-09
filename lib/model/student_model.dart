class Student {
  final String id;
  final String name;

  Student({required this.id, required this.name});

  factory Student.fromJson(Map<String, dynamic> json) =>
      Student(id: json['id'], name: json['name']);
}
