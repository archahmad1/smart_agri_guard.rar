import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _aiRecommendations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7B8C5F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xFFE9F5C6), shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Color(0xFF50623A)),
                    ),
                  ),
                  SizedBox(width: 12),
                  Image.asset('assets/logo.png', height: 28),
                  SizedBox(width: 8),
                  Text('Smart Agri-Guard',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 18),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color(0xFFEFF6C9),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    CircleAvatar(
                        child: Icon(Icons.person, color: Color(0xFF50623A)),
                        backgroundColor: Colors.transparent),
                    SizedBox(width: 12),
                    Expanded(
                        child: Text('Omar Abdallah Mohammad',
                            style: TextStyle(
                                color: Color(0xFF50623A),
                                fontWeight: FontWeight.bold))),
                    Icon(Icons.edit, color: Color(0xFF50623A))
                  ],
                ),
              ),
              SizedBox(height: 18),
              _settingRow(context, 'Notification', _notifications,
                  (v) => setState(() => _notifications = v)),
              Divider(color: Colors.white24),
              _settingRow(context, 'AI recommendations', _aiRecommendations,
                  (v) => setState(() => _aiRecommendations = v)),
              Divider(color: Colors.white24),
              _linkRow(context, 'Contact Us'),
              Divider(color: Colors.white24),
              _linkRow(context, 'Language'),
              Divider(color: Colors.white24),
              _linkRow(context, 'Help'),
              Divider(color: Colors.white24),
              _linkRow(context, 'Logout'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingRow(BuildContext context, String label, bool value,
      ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.notifications_none, color: Colors.white70),
          SizedBox(width: 12),
          Expanded(child: Text(label, style: TextStyle(color: Colors.white70))),
          Switch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _linkRow(BuildContext context, String label) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 18),
      title: Text(label, style: TextStyle(color: Colors.white70)),
      trailing: Icon(Icons.chevron_right, color: Colors.white54),
      onTap: () async {
        if (label == 'Logout') {
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('تأكيد الخروج'),
              content: Text('هل تريد الخروج من التطبيق؟'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(false),
                    child: Text('لا')),
                TextButton(
                    onPressed: () => Navigator.of(ctx).pop(true),
                    child: Text('نعم')),
              ],
            ),
          );
          if (confirmed == true) {
            SystemNavigator.pop();
          }
        } else {}
      },
    );
  }
}
