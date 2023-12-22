import 'animal.dart';

class Duck extends Animal {
  final String message;
  @override
  final String image;

  const Duck({
    required this.message,
    required this.image
  }) : super(image: '');

  factory Duck.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'message': String message,
        'url': String image
      } =>
        Duck(
          message: message,
          image: image
        ),
      _ => throw const FormatException('Failed to load dog.'),
    };
  }
}