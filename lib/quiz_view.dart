import 'package:flag_quiz_app/result_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreenView extends StatefulWidget {
  const QuizScreenView({super.key});

  @override
  State<QuizScreenView> createState() => _QuizScreenViewState();
}

class _QuizScreenViewState extends State<QuizScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Correct: 0"),
                Text("Wrong: 0"),
              ],
            ),
            Text("Qestion 1"),
            Image.asset("assets/turkiye.png"),
            FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ResultScreenView(
                                correct: 3,
                              )));
                },
                child: Text("Button A")),
            FilledButton(onPressed: () {}, child: Text("Button B")),
            FilledButton(onPressed: () {}, child: Text("Button C")),
            FilledButton(onPressed: () {}, child: Text("Button D")),
          ],
        ),
      ),
    );
  }
}
