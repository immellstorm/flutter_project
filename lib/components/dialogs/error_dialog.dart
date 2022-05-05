import 'package:flutter/material.dart';
import 'package:flutter_project/components/constants.dart';

void showErrorDialog(BuildContext context, {required String error}) {
  showDialog(
    context: context,
    builder: (_) => ErrorDialog(error: error),
  );
}

class ErrorDialog extends StatelessWidget {
  final String? error;
  const ErrorDialog({this.error, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(36),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: MovieColors.cardBlackColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CloseButton(color: Colors.white),
                  ],
                ),
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(height: 12),
                Text(
                  '${MovieLocal.error} ${error ?? MovieLocal.unknown}',
                ),
              ],
            )),
      ),
    );
  }
}
