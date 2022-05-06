import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/main_page.dart';
import 'package:flutter_project/components/widgets/not_found_page.dart';
import 'package:flutter_project/presentation/settings/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      initialRoute: MainPage.path,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == MainPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const MainPage();
            },
          );
        }

        if (settings.name == SettingsPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const SettingsPage();
            },
          );
        }

        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
      },
    );
  }
}
