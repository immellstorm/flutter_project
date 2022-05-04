import 'package:flutter/material.dart';
import 'package:flutter_project/app/features/home/pages/catalog_page.dart';
import 'package:flutter_project/app/features/home/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const path = '/';
  static const List<_Tab> _tabs = <_Tab>[
    _Tab(
      icon: Icon(Icons.movie_filter),
      label: 'Feed',
      page: HomePage(title: 'Feed'),
    ),
    _Tab(
      icon: Icon(Icons.local_movies_outlined),
      label: 'Catalog',
      page: CatalogPage(title: 'Catalog'),
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
    return Scaffold(
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
    );
  }
}

class _Tab {
  const _Tab({required this.icon, required this.page, required this.label});

  final Icon icon;
  final String label;
  final Widget page;
}
