import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Not found page',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
