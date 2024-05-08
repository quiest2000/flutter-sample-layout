import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                ImageSection(),
                TitleSection(
                    name: "Oeschinen Lake Campground",
                    location: "Kandersteg, Switzerland"),
                ButtonSection(),
                TextSection(
                  description:
                      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
                )
              ],
            ),
          )),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(location),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.star, color: Colors.red)),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(text: "CALL", icon: Icons.call, color: color),
        ButtonWithText(text: "ROUTE", icon: Icons.near_me, color: color),
        ButtonWithText(text: "SHARE", icon: Icons.share, color: color),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText(
      {super.key, required this.text, required this.icon, required this.color});

  final String text;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(text,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.bold))),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32),
        child: Text(description, softWrap: true));
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/lake.jpg',
      fit: BoxFit.cover,
    );
  }
}
