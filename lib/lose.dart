import 'package:flutter/material.dart';
import 'package:bertho/main.dart';
import 'package:bertho/quiz.dart';
import 'data.dart';
class LoseScreen extends StatelessWidget {
  final int score;

  LoseScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (score < 20)
              Text(
                'Really bad!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            if (score >= 20 && score < 50)
              Text(
                'Good job!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            if (score >= 50)
              Text(
                'Very good!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            SizedBox(height: 20),
            Text(
              'Your Score: $score',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              icon: Icon(Icons.replay),
              label: Text('Replay'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                updatetotalplay();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quiz()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.home),
              label: Text('Home Page'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizApp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
