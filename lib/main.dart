import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autocomplete',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 74),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _list = [
    'banana',
    'apple',
    'avocado',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autocomplete'),
      ),
      body: Center(
        child: Autocomplete<String>(
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable.empty();
            }
            return _list.where((element) => element.contains(textEditingValue.text.toLowerCase()));
          },
        ),
      ),
    );
  }
}
