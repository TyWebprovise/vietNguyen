

class Recipe {
  final String id;
  final String name;
  final String description;
  final String image;
  final String thumb;
  final String calories;
  final String carbos;
  final String fats;
  final String proteins;
  final String time;
  final int difficulty;
  final String headline;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.thumb,
    required this.calories,
    required this.carbos,
    required this.fats,
    required this.proteins,
    required this.time,
    required this.difficulty,
    required this.headline,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      thumb: json['thumb'],
      calories: json['calories'],
      carbos: json['carbos'],
      fats: json['fats'],
      proteins: json['proteins'],
      time: json['time'],
      difficulty: json['difficulty'],
      headline: json['headline'],
    );
  }
}