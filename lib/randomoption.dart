import 'dart:math';
List<String> getRandomOptions(List<String> options) {
  final random = Random();
  final randomizedOptions = List<String>.from(options);
  randomizedOptions.shuffle(random);
  return randomizedOptions;
}