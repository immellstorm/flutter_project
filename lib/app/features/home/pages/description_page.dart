import 'package:flutter/material.dart';
import 'package:flutter_project/app/features/home/widgets/film_description.dart';

class DescriptionArguments {
  const DescriptionArguments(this.id);

  final int id;
}

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({required this.arguments, Key? key}) : super(key: key);
  final DescriptionArguments arguments;
  static const path = '/description';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
      ),
      body: FilmDescription(
        arguments: arguments,
      ),
    );
  }
}
