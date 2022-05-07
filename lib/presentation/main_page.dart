import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/components/constants.dart';
import 'package:flutter_project/data/repositories/movies_repository.dart';
import 'package:flutter_project/error_bloc/error_bloc.dart';
import 'package:flutter_project/error_bloc/error_event.dart';
import 'package:flutter_project/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_project/presentation/home/home_screen.dart';
import 'package:flutter_project/presentation/home/wishlist_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const path = '/';
  static const List<_Tab> _tabs = <_Tab>[
    _Tab(
      icon: Icon(Icons.movie_filter),
      label: MovieLocal.movies,
      page: HomeScreen(),
    ),
    _Tab(
      icon: Icon(Icons.favorite),
      label: MovieLocal.wishlist,
      page: WishlistPage(),
    ),
  ];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ErrorBloc>(
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
            child: Scaffold(
              body: MainPage._tabs.elementAt(_selectedIndex).page,
              bottomNavigationBar: BottomNavigationBar(
                items: List.generate(
                  MainPage._tabs.length,
                  (index) {
                    final _Tab tab = MainPage._tabs[index];
                    return BottomNavigationBarItem(
                      icon: tab.icon,
                      label: tab.label,
                    );
                  },
                ),
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            )),
      ),
    );
  }
}

class _Tab {
  const _Tab({required this.icon, required this.page, required this.label});

  final Icon icon;
  final String label;
  final Widget page;
}
