import 'package:flutter/material.dart';

class SettingsManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manager Settings'),
        backgroundColor: Color(0xFF6B8A4A),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
