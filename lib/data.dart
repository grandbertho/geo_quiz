import 'package:http/http.dart' as http;
import 'dart:convert';

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
      print('Capital: ${country['capital'][0]}');
      print('Population: ${country['population']}');
      print('Languages: ${country['languages'].values.join(', ')}');
      print('Currencies: ${country['currencies'].values.join(', ')}');
      // Add more properties as needed
    }
  }
}

