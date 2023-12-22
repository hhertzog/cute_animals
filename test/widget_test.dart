// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final apiUrl = 'https://randomfox.ca/floof/';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print('Fox Image URL: ${data['image']}');
    } else {
      print('Failed to fetch a mystical fox. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error: $error');
  }
}