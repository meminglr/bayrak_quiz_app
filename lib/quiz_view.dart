import 'dart:collection';

import 'package:flag_quiz_app/flags.dart';
import 'package:flag_quiz_app/flagsdao.dart';
import 'package:flag_quiz_app/result_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreenView extends StatefulWidget {
  const QuizScreenView({super.key});

  @override
  State<QuizScreenView> createState() => _QuizScreenViewState();
}

class _QuizScreenViewState extends State<QuizScreenView> {
  var questions = <Flags>[];
  var wrongOptions = <Flags>[];
  late Flags currentQuestion;
  var allOptions = HashSet<Flags>();

  int questionCounter = 0;
  int correctCounter = 0;
  int wrongCounter = 0;

  String flagImageName = "placeholder.png";

  String optionA = "";
  String optionB = "";
  String optionC = "";
  String optionD = "";

  @override
  void initState() {
    super.initState();
    getQuestion();
  }

  Future<void> getQuestion() async {
    questions = await Flagsdao().getRandom5Flags();
    loadQuestion();
  }

  Future<void> loadQuestion() async {
    currentQuestion = questions[questionCounter];
    flagImageName = currentQuestion.flag_image;

    allOptions.clear();
    allOptions.add(currentQuestion);
    allOptions.add(wrongOptions[0]);
    allOptions.add(wrongOptions[1]);
    allOptions.add(wrongOptions[2]);

    optionA = allOptions.elementAt(0).flag_name;
    optionB = allOptions.elementAt(1).flag_name;
    optionC = allOptions.elementAt(2).flag_name;
    optionD = allOptions.elementAt(3).flag_name;

    setState(() {});
  }

  void questionCounterCheck() {
    if (questionCounter < 4) {
      questionCounter++;
      loadQuestion();
    } else {
      Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
              builder: (context) => ResultScreenView(
                    correct: correctCounter,
                  )));
    }
  }

  void resultCheck(String buttonName) {
    if (buttonName == currentQuestion.flag_name) {
      correctCounter++;
    } else {
      wrongCounter++;
    }
  }

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
                Text("Correct: $correctCounter"),
                Text("Wrong: $wrongCounter"),
              ],
            ),
            Text("Qestion ${questionCounter + 1}"),
            Image.asset("assets/$flagImageName"),
            FilledButton(onPressed: () {}, child: Text("$optionA")),
            FilledButton(onPressed: () {}, child: Text(" $optionB")),
            FilledButton(onPressed: () {}, child: Text("$optionC")),
            FilledButton(onPressed: () {}, child: Text("$optionD")),
          ],
        ),
      ),
    );
  }
}
