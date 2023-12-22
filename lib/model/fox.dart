import 'animal.dart';

class Fox extends Animal {
  @override
  final String image;
  final String link;

  const Fox({
    required this.image,
    required this.link
  }) : super(image: '');

  factory Fox.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'image': String image,
        'link': String link
      } =>
        Fox(
          image: image,
          link: link
        ),
      _ => throw const FormatException('Failed to load fox.'),
    };
  }
}