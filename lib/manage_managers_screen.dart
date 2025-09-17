import 'package:flutter/material.dart';
import 'add_manager_screen.dart';
import 'update_manager_screen.dart';

class ManageManagersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF7B8C5F);
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Image.asset('assets/logo.png', width: 26, height: 26),
                          SizedBox(width: 8),
                          Text('Smart Agri-Guard',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18))
                        ]),
                        SizedBox(height: 6),
                        Text('Manage Manager',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddManagerScreen())),
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white24, shape: BoxShape.circle),
                        child: Icon(Icons.add, color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Expanded(
                child: ListView(
                  children: [
                    _ManagerItem(
                        name: 'Ahmad Amer Abdullah',
                        subtitle: 'Greenhouse A',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UpdateManagerScreen(
                                    name: 'Ahmad Amer Abdullah')))),
                    _ManagerItem(
                        name: 'Mousa Ali albdulrahman',
                        subtitle: 'Greenhouse B',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UpdateManagerScreen(
                                    name: 'Mousa Ali albdulrahman')))),
                    _ManagerItem(
                        name: 'Issa Ibraheem Abdullah',
                        subtitle: 'Greenhouse C, Greenhouse D',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UpdateManagerScreen(
                                    name: 'Issa Ibraheem Abdullah')))),
                    SizedBox(height: 24),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ManagerItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final VoidCallback onTap;
  const _ManagerItem(
      {required this.name, required this.subtitle, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Color(0xFFE9F5C6), borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color(0xFF2C3A1A))),
          SizedBox(width: 12),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF2C3A1A), fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Color(0xFF2C3A1A)))
              ])),
          Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF2C3A1A))
        ]),
      ),
    );
  }
}
