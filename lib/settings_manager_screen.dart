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
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              subtitle: Text('Edit manager profile and credentials'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              subtitle: Text('Manage alert preferences for this manager'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shield),
              title: Text('Permissions'),
              subtitle: Text('Configure manager permissions'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
