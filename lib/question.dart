import 'data.dart';
import 'dart:math';

Future<Question> fetchQuestion() async {
  Random random = Random();
  List<dynamic> countries = await fetchCountryData();
  int randomIndex = random.nextInt(countries.length);
  int randomIndex2 =  random.nextInt(countries.length);
  int randomIndex3 =  random.nextInt(countries.length);
  int randomIndex4 =  random.nextInt(countries.length);
  while(randomIndex2==randomIndex){
     randomIndex2 =  random.nextInt(countries.length);
  };

  while(randomIndex3 == randomIndex ||randomIndex3 == randomIndex2 ){
     randomIndex3 =  random.nextInt(countries.length);
  };
  while(randomIndex4 == randomIndex ||randomIndex4 == randomIndex2 || randomIndex4 == randomIndex3 ){
    randomIndex3 =  random.nextInt(countries.length);
  };
 Map <String,dynamic> country = countries[randomIndex];
 String label = "What's the Capital of   ${country['name']['common']} ?";
 List<String> options = ["${countries[randomIndex]['capital'][0]}","${countries[randomIndex2]['capital'][0]}","${countries[randomIndex3]['capital'][0]}","${countries[randomIndex4]['capital'][0]}"];
 String goodAnswer = "${countries[randomIndex]['capital'][0]}";
 Question question = Question(label, options, goodAnswer);
  return question;
}
class Question {
  String label;
  List<String> options;
  String goodAnswer;
  Question(this.label,this.options,this.goodAnswer);

}