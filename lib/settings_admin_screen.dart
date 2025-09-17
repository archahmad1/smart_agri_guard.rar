import 'package:flutter/material.dart';

class SettingsAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Settings'),
        backgroundColor: Color(0xFF7B8C5F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.tune),
              title: Text('System Settings'),
              subtitle: Text('Global application settings'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.manage_accounts),
              title: Text('Manage Managers'),
              subtitle: Text('Add/Remove managers and assign greenhouses'),
              onTap: () => Navigator.pushNamed(context, '/manage_managers'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.backup),
              title: Text('Backup & Export'),
              subtitle: Text('Export system data'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
