import 'package:flutter/material.dart';
import './api/random_fox.dart';
import './api/random_dog.dart';
import './api/random_duck.dart';
import './model/fox.dart';
import './model/dog.dart';
import './model/duck.dart';
import './model/animal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RandomFox randomFox = RandomFox();
  RandomDog randomDog = RandomDog();
  RandomDuck randomDuck = RandomDuck();
  late Future<Animal> futureAnimal;

  @override
  void initState() {
    super.initState();
    futureAnimal = randomFox.fetchFox() as Future<Animal>;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cute Animal Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cute Animals'),
        ),
        body: Column(
          children: [
            AnimalImage(futureAnimal: futureAnimal),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: fetchNewFoxImage,
              child: Text('🦊Show Me a Fox 🦊'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: fetchNewDogImage,
              child: Text('🐶Show Me a Dog🐶'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: fetchNewDuckImage,
              child: Text('🦆Show Me a Duck🦆'),
            ),
          ],
        ),
      ),
    );
  }

  void fetchNewFoxImage() {
    setState(() {
      // Trigger a new call to the API when the button is pressed
      futureAnimal = randomFox.fetchFox();
    });
  }

  void fetchNewDogImage() {
    setState(() {
      // Trigger a new call to the API when the button is pressed
      futureAnimal = randomDog.fetchDog();
    });
  }

    void fetchNewDuckImage() {
    setState(() {
      // Trigger a new call to the API when the button is pressed
      futureAnimal = randomDuck.fetchDuck();
    });
  }
}

class AnimalImage extends StatelessWidget {
  const AnimalImage({
    super.key,
    required this.futureAnimal,
  });

  final Future<Animal> futureAnimal;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Animal>(
      future: futureAnimal,
      builder: (context, snapshot) {
        if (snapshot.hasData && !snapshot.data!.image.endsWith('mp4')) {
          return Image.network(
            snapshot.data?.image ?? '',
            height: 500,
            width: 500,
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
    
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}