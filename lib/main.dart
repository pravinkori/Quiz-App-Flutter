import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'This is where the question text will go.',
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
              onTapUp: () => HapticFeedback.vibrate(),
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
              onTapUp: () => HapticFeedback.vibrate(),
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
          children: [
            Icon(
              Icons.check_rounded,
              color: Color(0xffbdde8f),
            ),
            Icon(
              Icons.close_rounded,
              color: Colors.redAccent,
            )
          ],
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
// Cred's Neopop Button
