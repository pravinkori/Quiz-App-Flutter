import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';
import './quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(
    Quizzler(),
  );
}

class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff1f4590),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You\'ve reached the end of the quiz.',
          closeIcon: const Icon(
            Icons.close_rounded,
          ),
          style: AlertStyle(
            backgroundColor: Colors.white,
            titleStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
            descStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
            isButtonVisible: true,
            isOverlayTapDismiss: false,
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          buttons: [
            DialogButton(
              color: Colors.white,
              radius: BorderRadius.zero,
              onPressed: () => null,
              child: NeoPopButton(
                color: Colors.green,
                onTapUp: () {
                  Navigator.pop(context);
                  HapticFeedback.vibrate();
                },
                onTapDown: () => HapticFeedback.vibrate(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Done",
                        style: TextStyle(
                          overflow: TextOverflow.visible,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Color(0xffbdde8f),
            ),
          );
          print('User chose right answer');
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close_rounded,
              color: Colors.redAccent,
            ),
          );
          print('User chose wrong answer');
        }

        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // questions[questionIndex],
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffF0B666),
                  fontFamily: 'Poppins',
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: NeoPopButton(
              color: Colors.green,
              onTapUp: () {
                checkAnswer(true);
                HapticFeedback.vibrate();
              },
              onTapDown: () => HapticFeedback.vibrate(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "True",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: NeoPopButton(
              color: Colors.redAccent,
              onTapUp: () {
                checkAnswer(false);
                HapticFeedback.vibrate();
              },
              onTapDown: () => HapticFeedback.vibrate(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

// Text Button
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: TextButton(
//       onPressed: null,
//       style: TextButton.styleFrom(
//         backgroundColor: Colors.green,
//       ),
//       child: const Text(
//         'True',
//         style: TextStyle(
//           fontFamily: 'Poppins',
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: 30.0,
//         ),
//       ),
//     ),
//   ),
// ),
// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: TextButton(
//       onPressed: null,
//       style: TextButton.styleFrom(
//         backgroundColor: Colors.red,
//       ),
//       child: const Text(
//         'False',
//         style: TextStyle(
//           fontFamily: 'Poppins',
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: 30.0,
//         ),
//       ),
//     ),
//   ),
// ),
