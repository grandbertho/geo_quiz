import 'package:bertho/bestscore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Statistique extends StatelessWidget {
  Future<int> getTotalPlayCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('totalPlayCount') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ), // Set the background color to blue
      child: Center(
        child: FutureBuilder(
          future: Future.wait([getTotalPlayCount(), loadBestScore()]),
          builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              );
            } else {
              int totalPlayCount = snapshot.data![0];
              int bestScore = snapshot.data![1];
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    padding: EdgeInsets.all(10), // Apply padding to the text
    decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10), // Apply border radius
    ),
    child: Text(
    'Total Play Count: $totalPlayCount',
    style: TextStyle(
    fontSize: 30,
    color: Colors.white,
    ),
    ),
    ),
    SizedBox(height: 10),
    Container(
    padding: EdgeInsets.all(10), // Apply padding to the text
    decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10), // Apply border radius
    ),
    child: Text(
    'Best Score: $bestScore',
    style: TextStyle(
    fontSize: 30,
    color: Colors.white,
    ),
    ),
    ),
    ],
    );
            }
          },
        ),
      ),
    );
  }

}
