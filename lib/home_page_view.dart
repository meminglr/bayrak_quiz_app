import 'package:bayrak_quiz_app/quiz_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flag Quiz"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: FilledButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => QuizScreenView()),
                    );
                  },
                  icon: const Icon(
                    Icons.play_arrow_outlined,
                    size: 50,
                  ),
                  label: const Text("Start To Game")),
            )
          ],
        ),
      ),
    );
  }
}
