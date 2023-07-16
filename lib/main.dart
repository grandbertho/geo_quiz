import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'home.dart';
import 'setting.dart';
import 'statistique.dart';
import 'bestscore.dart';
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Geo Quiz ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: QuizScreen(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    Statistique(),
    Home(),
    Setting(),
  ];

  int bestScore = 0;

  void _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geo Quiz',style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
        drawer :Drawer(
          backgroundColor: Colors.blue.shade100,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Image.asset(
                          'assets/globe.png', // Replace with the path to your image
                          width: 120,
                          height: 120,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Geo Quiz',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.score),
                title: Text('Best Score'),
                onTap:() {
              Navigator.pop(context);
          showDialog(
          context: context,
          builder: (BuildContext context) {
          loadBestScore().then((best){
            bestScore = best;
          });
          return AlertDialog(
          title: Text('Best Score'),
          content: Text('Current best score: ${bestScore ?? 'Loading...'}'),
          actions: [
          ElevatedButton(
          onPressed: () {
          Navigator.of(context).pop();
          },
          child: Text('Okay'),
          ),
          ],
          );
          },
          );
          },
              ),
              ListTile(
                leading: Icon(Icons.android),
                title: Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  showAboutDialog(context: context);
                },
              ),
              ListTile(
                leading: Icon(Icons.share_outlined),
                title: Text('Share this App'),
                onTap: () {
                  Navigator.pop(context);
                  Share.share('Check out this app: https://bertho.online');
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app_outlined),
                title: Text('Exit'),
                onTap: () {
                  Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Are you sure you want to leave the app?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                exit(0);
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        );
                      },
                    ).then((confirmed) {
                      if (confirmed == true) {
                        Navigator.of(context).pop();
                      }
                    });
                },
              ),
            ],
          ),
        ),


        body: _screens[_currentIndex],
    bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.white,
    color: Colors.blueAccent,
    index: 1,
    items: <Widget>[
    Icon(Icons.account_circle_outlined, size: 30,color: Colors.white,),
    Icon(Icons.home, size: 30,color: Colors.white),
    Icon(Icons.settings, size: 30,color: Colors.white,),
    ],
    onTap: (index) {
      _changeScreen(index);
    }
    ));
  }
}
