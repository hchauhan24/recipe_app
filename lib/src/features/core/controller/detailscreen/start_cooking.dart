import 'package:url_launcher/url_launcher.dart';

class StartCooking {
  static Future<void> startCooking(String url) async {
    final recipeDirections = Uri.parse(url);
    if (!await launchUrl(recipeDirections)) {
      throw Exception('Could not launch directions');
    }
  }
}
