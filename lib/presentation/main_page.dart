import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/components/locals/locals.dart';
import 'package:flutter_project/data/repositories/movies_repository.dart';
import 'package:flutter_project/error_bloc/error_bloc.dart';
import 'package:flutter_project/error_bloc/error_event.dart';
import 'package:flutter_project/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_project/presentation/home/home_screen.dart';
import 'package:flutter_project/presentation/wishlist/wishlist_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const path = '/';

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
    List<_Tab> _tabs = <_Tab>[
      _Tab(
        icon: const Icon(Icons.movie_filter),
        label: context.locale.movies,
        page: const HomeScreen(),
      ),
      _Tab(
        icon: const Icon(Icons.favorite),
        label: context.locale.wishlist,
        page: const WishlistPage(),
      ),
    ];
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
              body: _tabs.elementAt(_selectedIndex).page,
              bottomNavigationBar: BottomNavigationBar(
                items: List.generate(
                  _tabs.length,
                  (index) {
                    final _Tab tab = _tabs[index];
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
