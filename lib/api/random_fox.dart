import 'dart:convert';
import 'package:http/http.dart' as http;

class RandomFox {
  final String apiUrl = 'https://randomfox.ca/floof/';

  Future<String> fetchFoxImage() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['image'];
    } else {
      throw Exception('Failed to get fox image');
    }
  }
}