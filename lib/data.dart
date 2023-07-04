import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
Future<List<dynamic>> fetchCountryData() async {
  final url = Uri.parse('https://restcountries.com/v3.1/all');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data;
  } else {
    print('Failed to fetch country data. Status code: ${response.statusCode}');
    return []; // or return null, depending on your needs
  }
}

void main() async {
  List<dynamic> countries = await fetchCountryData();

  if (countries.isNotEmpty) {
    for (var country in countries) {
      print('Name: ${country['name']['official']}');
      print('Capital: ${country['capital']}');

      // Add more properties as needed
    }
  }
}
void updatetotalplay() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int total = prefs.getInt('totalPlayCount') ?? 0;
  prefs.setInt('totalPlayCount', total + 1);
}

