import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/components/locals/locals.dart';
import 'package:flutter_project/components/widgets/primary_button.dart';
import 'package:flutter_project/presentation/settings/bloc/setting_bloc.dart';
import 'package:flutter_project/presentation/settings/bloc/setting_event.dart';
import 'package:flutter_project/presentation/settings/bloc/setting_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const path = '/settings';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingBloc>(
        lazy: false,
        create: (_) => SettingBloc()
          ..add(
            LoadNameEvent(),
          ),
        child: const SettingsPageContent());
  }
}

class SettingsPageContent extends StatefulWidget {
  const SettingsPageContent({Key? key}) : super(key: key);

  @override
  State<SettingsPageContent> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.settings),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SettingBloc, SettingState>(
                buildWhen: (oldState, newState) =>
                    oldState.name != newState.name,
                builder: (context, state) {
                  return Text(
                    state.name ?? '',
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                    ),
                  );
                }),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(context.locale.getName, onPressed: () {
                    context.read<SettingBloc>().add(LoadNameEvent());
                  })
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(context.locale.saveName,
                      onPressed: () => context
                          .read<SettingBloc>()
                          .add(const SaveNameEvent(name: 'Mad Brains')))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(context.locale.clearName,
                      onPressed: () =>
                          context.read<SettingBloc>().add(ClearNameEvent()))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.exit_to_app),
                  Text(context.locale.exit),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.arrow_back),
                  Text(context.locale.back),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
