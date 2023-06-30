import 'package:shared_preferences/shared_preferences.dart';

Future<int> loadBestScore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
   int bestScore = prefs.getInt('bestScore') ?? 0;
  return bestScore;
}