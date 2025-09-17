import 'package:flutter/material.dart';
import 'add_greenhouse_screen.dart';
import 'update_greenhouse_screen.dart';

class ManageGreenhousesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF6B8A4A);
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
                        Row(
                          children: [
                            Image.asset('assets/logo.png',
                                width: 26, height: 26),
                            SizedBox(width: 8),
                            Text('Smart Agri-Guard',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ],
                        ),
                        SizedBox(height: 6),
                        Text('Manage Greenhouses',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AddGreenhouseScreen())),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Expanded(
                child: ListView(
                  children: [
                    _GHItem(
                        name: 'Greenhouse A',
                        image: 'assets/pepper.jpg',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UpdateGreenhouseScreen(
                                    name: 'Greenhouse A')))),
                    _GHItem(
                        name: 'Greenhouse B',
                        image: 'assets/tomato.jpg',
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UpdateGreenhouseScreen(
                                    name: 'Greenhouse B')))),
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

class _GHItem extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;

  const _GHItem({required this.name, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Color(0xFFE9F5C6), borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(image,
                    width: 48, height: 48, fit: BoxFit.cover)),
            SizedBox(width: 12),
            Expanded(
                child: Text(name,
                    style: TextStyle(
                        color: Color(0xFF2C3A1A),
                        fontWeight: FontWeight.w600))),
            Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF2C3A1A)),
          ],
        ),
      ),
    );
  }
}
