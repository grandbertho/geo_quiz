import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}
void sendEmail(String body) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'lensbroh@gmail.com', // Replace with your email address
    query: 'body=$body',
  );

  String url = params.toString();

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class _SettingState extends State<Setting> {
  bool _isSelected = true;

  @override
  void initState() {
    super.initState();
    loadSoundState();
  }

  void loadSoundState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isSelected = prefs.getBool('soundState') ?? true;
    });
  }

  void showAboutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('About the App'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Geo Quiz - Test your knowledge of capitals',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Version: 1.0'),
              SizedBox(height: 10),
              Text('Developer Contact:'),
              GestureDetector(
                onTap: () => launch('mailto:michelbertho25@gmail.com'),
                child: Text(
                  'michelbertho25@gmail.com',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => launch('https://bertho.online'),
                child: Text(
                  'bertho.online',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void saveSoundState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('soundState', value);
    setState(() {
      _isSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
       child: Scaffold(
      backgroundColor: Colors.transparent, // Set background color to blue
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Colors.blue, // Set the background color of the switch
                    borderRadius: BorderRadius.circular(30), // Set the border radius
                  ),
                  child: SwitchListTile(
                title: Text(
                  '     Sound',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                value: _isSelected,
                onChanged: (bool value) {
                  saveSoundState(value);
                },
                tileColor: Colors.blue, // Set the background color here
                activeColor: Colors.white, // Set the active color when the switch is enabled
                inactiveTrackColor: Colors.grey, // Set the color of the inactive switch track
                inactiveThumbColor: Colors.grey, // Set the color of the inactive switch thumb
              )

              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity, // Make the button full width
                child: ElevatedButton.icon(
                  icon: Icon(Icons.share_outlined),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  label: Text(
                    'Share App',
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Share.share('Check out this app: https://bertho.online');
                  },
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity, // Make the button full width
                child: ElevatedButton.icon(
                  icon: Icon(Icons.comment),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  label: Text(
                    'Leave a Comment',
                    style: TextStyle(fontSize: 25),
                  ),
    onPressed: () {
    final TextEditingController commentController = TextEditingController();

    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('Leave a Comment'),
    content: TextField(
    controller: commentController,
    maxLines: null,
    decoration: InputDecoration(
    hintText: 'Write your comment...',
    ),
    ),
    actions: [
    TextButton(
    child: Text('Cancel'),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    TextButton(
    child: Text('Send'),
    onPressed: () {
    String comment = commentController.text;
    sendEmail(comment);
    Navigator.of(context).pop();
    },
    ),
    ],
    );
    },
    );}
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity, // Make the button full width
                child: ElevatedButton.icon(
                  icon: Icon(Icons.android_outlined),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  label: Text(
                    'About',
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    showAboutDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
