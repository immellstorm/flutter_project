import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/data/repositories/movies_repository.dart';
import 'package:flutter_project/error_bloc/error_bloc.dart';
import 'package:flutter_project/error_bloc/error_event.dart';
import 'package:flutter_project/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_project/presentation/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      home: BlocProvider<ErrorBloc>(
        lazy: false,
        create: (_) => ErrorBloc(),
        child: RepositoryProvider<MoviesRepository>(
          lazy: true,
          create: (BuildContext context) => MoviesRepository(
            onErrorHandler: (String code, String message) {
              context
                  .read<ErrorBloc>()
                  .add(ShowDialogEvent(title: code, message: message));
            },
          ),
          child: BlocProvider<HomeBloc>(
            lazy: false,
            create: (BuildContext context) =>
                HomeBloc(context.read<MoviesRepository>()),
            child: const HomeScreen(),
          ),
        ),
      ),
    );
  }
}
