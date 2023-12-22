import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/dog.dart';

class RandomDog {
  final String apiUrl = 'https://random.dog/woof.json';

  Future<Dog> fetchDog() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Dog.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dog');
    }
  }
}