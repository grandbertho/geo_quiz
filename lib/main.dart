import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'setting.dart';
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
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
    Screen1(),
    Home(),
    Setting(),
  ];

  void _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
      ),
      drawer: Drawer(),

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

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Screen 1',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

