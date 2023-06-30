import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SwitchListTile(
                title: Text(
                  'Sound',
                  style: TextStyle(fontSize: 18),
                ),
                value: _isSelected,
                onChanged: (bool value) {
                  setState(() {
                    _isSelected = value;
                    // Logic to handle sound activation/deactivation
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Language',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              LanguageSelector(),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Share App',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  // Logic to handle sharing the app
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Leave a Comment',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  // Logic to handle leaving a comment
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'About',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  // Logic to handle the "About" screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedLanguage,
      items: <String>['English', 'Creole'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedLanguage = newValue!;
          // Logic to update language preferences
        });
      },
    );
  }
}
