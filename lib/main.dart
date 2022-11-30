import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';
import './question.dart';

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
  List<Widget> scoreKeeper = [
    // Icon(
    //   Icons.check_rounded,
    //   color: Color(0xffbdde8f),
    // ),
    // Icon(
    //   Icons.close_rounded,
    //   color: Colors.redAccent,
    // )
  ];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in feet.',
  //   'A slug\'s blood is green.'
  // ];
  //
  // List<bool> answers = [false, true, true];
  //
  // Question questioOne = Question(
  //     question: 'You can lead a cow down stairs but not up stairs.',
  //     answer: false);

  List<Question> questionBank = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true)
  ];

  int questionIndex = 0;

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
                questionBank[questionIndex].questionText,
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
                bool correctAnswer = questionBank[questionIndex].questionAnswer;

                if (correctAnswer == true) {
                  print('User chose right answer');
                } else {
                  print('User chose wrong answer');
                }

                setState(() {
                  questionIndex++;
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Color(0xffbdde8f),
                    ),
                  );
                });

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
                bool correctAnswer = questionBank[questionIndex].questionAnswer;

                if (correctAnswer == false) {
                  print('User chose right answer');
                } else {
                  print('User chose wrong answer');
                }
                setState(() {
                  questionIndex++;
                  scoreKeeper.add(
                    Icon(
                      Icons.close_rounded,
                      color: Colors.redAccent,
                    ),
                  );
                });
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
        //TODO: Add a Row here as your score keeper
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
