import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project/components/locals/locals.dart';
import 'package:flutter_project/locale_bloc/locale_bloc.dart';
import 'package:flutter_project/locale_bloc/locale_state.dart';
import 'package:flutter_project/presentation/main_page.dart';
import 'package:flutter_project/components/widgets/not_found_page.dart';
import 'package:flutter_project/presentation/settings/pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleBloc>(
      lazy: false,
      create: (_) => LocaleBloc(),
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movies',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              fontFamily: 'ChakraPetch-Medium',
            ),
            locale: state.locale,
            localizationsDelegates: <LocalizationsDelegate<dynamic>>[
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              MyLocalizationsDelegate(initialLocals),
            ],
            supportedLocales: availableLocales.values,
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
        },
      ),
    );
  }
}
