import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreenView extends StatefulWidget {
  int correct;
  ResultScreenView({
    Key? key,
    required this.correct,
  }) : super(key: key);

  @override
  State<ResultScreenView> createState() => _ResultScreenViewState();
}

class _ResultScreenViewState extends State<ResultScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Correct: ${widget.correct} Wrong: ${5 - widget.correct}"),
            Text("%${(widget.correct * 100) ~/ 5} Success"),
            SizedBox(
              height: 100,
              child: FilledButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.play_arrow_outlined,
                    size: 50,
                  ),
                  label: const Text("Try Again")),
            )
          ],
        ),
      ),
    );
  }
}
