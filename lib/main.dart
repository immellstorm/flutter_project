import 'package:flutter/material.dart';
import 'package:flutter_project/app/features/settings/pages/settings_page.dart';
import 'package:flutter_project/app/widgets/main_page.dart';
import 'package:flutter_project/app/widgets/not_found_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Films',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: MainPage.path,
      routes: {
        '/': (context) => const MainPage(),
        '/settings': (context) => const SettingsPage(
              arguments: SettingsArguments('BOBIK'),
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == MainPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const MainPage();
            },
          );
        }

        if (settings.name == SettingsPage.path) {
          final SettingsArguments arguments =
              settings.arguments as SettingsArguments;
          return MaterialPageRoute(
            builder: (context) {
              return SettingsPage(
                arguments: arguments,
              );
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
