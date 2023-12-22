import 'animal.dart';

class Dog extends Animal {
  final int fileSizeBytes;
  @override
  final String image;

  const Dog({
    required this.fileSizeBytes,
    required this.image
  }) : super(image: '');

  factory Dog.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'fileSizeBytes': int fileSizeBytes,
        'url': String image
      } =>
        Dog(
          fileSizeBytes: fileSizeBytes,
          image: image
        ),
      _ => throw const FormatException('Failed to load dog.'),
    };
  }
}