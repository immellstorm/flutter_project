import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/description/page/film_description.dart';

class DescriptionArguments {
  const DescriptionArguments(this.id, this.title, this.picture,
      this.releaseDate, this.voteAverage, this.description);

  final int id;
  final String title;
  final String? picture;
  final String? releaseDate;
  final double? voteAverage;
  final String? description;
}

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({required this.arguments, Key? key}) : super(key: key);
  final DescriptionArguments arguments;
  static const path = '/description';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          arguments.title,
        ),
      ),
      body: FilmDescription(
        arguments: arguments,
      ),
    );
  }
}

// class DescriptionPage extends StatelessWidget {
//   const DescriptionPage({required this.arguments, Key? key}) : super(key: key);
//   final DescriptionArguments arguments;
//   static const path = '/description';

// @override
// Widget build(BuildContext context) {
//   return BlocProvider<DescriptionBloc>(
//       lazy: false,
//       create: (_) => DescriptionBloc()
//         ..add(
//           LoadNameEvent(),
//         ),
//       child: const DescriptionContent());
// }
// }
//
// class DescriptionContent extends StatefulWidget {
//   const DescriptionContent({Key? key}) : super(key: key);
//
//   @override
//   State<DescriptionContent> createState() => _DescriptionContent();
// }
//
// class _DescriptionContent extends State<DescriptionContent> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Description'),
//       ),
//       body: FilmDescription(arguments: id),
//     );
//   }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Description'),
//     ),
//     body: Center(
//       child: Column(
//         children: [
//           BlocBuilder<DescriptionBloc, DescriptionState>(
//               builder: (context, state) {
//                 return Text('111');
//                   ),
//               }),
//         ],
//       ),
//     ),
//   );
// }
//}
