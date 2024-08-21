
import 'package:hive/hive.dart';


part 'recipe_model.g.dart';

@HiveType(typeId: 0)
class Recipe extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String label;
  @HiveField(2)
  String image;
  @HiveField(3)
  String url;
  @HiveField(4)
  String time;
  @HiveField(5)
  List<Map<dynamic, dynamic>> ingredients;

  Recipe({
    required this.id,
    required this.label,
    required this.image,
    required this.url,
    required this.time,
    required this.ingredients,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'image': image,
      'url': url,
      'time': time,
      'ingredients': ingredients,
    };
  }

  factory Recipe.fromMap(Map<dynamic, dynamic> map) {
    return Recipe(
       id: map['id'], 
      label: map['label'],
      image: map['image'],
      url: map['url'],
      time: map['time']??'0.0',
      ingredients: List<Map<dynamic, dynamic>>.from(map['ingredients']),
    );
  }
}
