import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'lose.dart';
import 'randomoption.dart';
import 'main.dart';
class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Question? question;
  int score = 0;
  int bestScore = 0;

  @override
  void initState() {
    super.initState();
    loadBestScore();
    fetchQuestion().then((fetchedQuestion) {
      setState(() {
        question = fetchedQuestion;
      });
    });
    // Load the best score when the app starts
  }

  void loadBestScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bestScore = prefs.getInt('bestScore') ?? 0;
    });
  }

  void saveBestScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('bestScore', bestScore);
  }

  void handleOptionSelection(String selectedOption) {
    if (selectedOption == question!.goodAnswer) {
      fetchQuestion().then((fetchedQuestion) {
        setState(() {
          question = fetchedQuestion;
          score += 10;
          if (score > bestScore) {
            bestScore = score;
            saveBestScore(); // Save the best score when it's updated
          }
        });
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoseScreen(score: score)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, right: 10),
            child: Text(
              "Best Score: $bestScore",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            if (question != null)
              Text(
                question!.label,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            if (question != null)
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Column(
                      children: getRandomOptions(question!.options).map((option) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: ListTile(
                              hoverColor: Colors.cyanAccent,
                              focusColor: Colors.cyanAccent,
                              title: Text(
                                option,
                                style: TextStyle(color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                              onTap: () {
                                handleOptionSelection(option);
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            if (question == null)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.5),
                  CircularProgressIndicator.adaptive(
                    strokeWidth: 1,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ],
              ),
            SizedBox(height: 60),
            Text(
              "Score: $score",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 20),
              if(question != null)
              Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the elements horizontally
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        score = 0;
                      });
                      fetchQuestion().then((fetchedQuestion) {
                        setState(() {
                          question = fetchedQuestion;
                        });
                      });
                    },
                    icon: Icon(Icons.replay),
                    label: Text('Restart',style: TextStyle(fontSize: 20),),
                  ),
                ),
                SizedBox(width: 10), // Add some spacing between the buttons
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizApp()),
                      );
                    },
                    icon: Icon(Icons.home),
                    label: Text('Home Page',style: TextStyle(fontSize: 20)),
                  ),
                ),
                SizedBox(width: 10,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
