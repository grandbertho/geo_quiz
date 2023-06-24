import 'package:flutter/material.dart';
import 'quiz.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Set the background color to transparent

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Welcome to Geographie Quiz',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set button background color
                  onPrimary: Colors.white, // Set button text color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white,width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                icon: Icon(Icons.gamepad_outlined),
                onPressed: () {
                  // Start the quiz
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz()),
                  );
                },
                label: Text(
                  '  New  Quiz  ',
                  style: TextStyle(fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set button background color
                  onPrimary: Colors.white, // Set button text color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white,width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.score),
                onPressed: () {},
                label: Text(
                  '  Best  Score  ',
                  style: TextStyle(fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set button background color
                  onPrimary: Colors.white, // Set button text color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white,width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.exit_to_app_outlined),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmation'),
                        content: Text('Are you sure you want to leave the app?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, false); // Return false if the user cancels
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, true); // Return true if the user confirms
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  ).then((confirmed) {
                    if (confirmed == true) {
                      // User confirmed, close the app
                      Navigator.of(context).pop();
                    }
                  });
                },
                label: Text(
                  '  Leave  App  ',
                  style: TextStyle(fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Set button background color
                  onPrimary: Colors.white, // Set button text color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white,width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
