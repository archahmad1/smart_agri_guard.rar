import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF6B8A4A);
    final cardColor = Color(0xFFF2EFBF);

    Widget alertCard(String text, String time) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            bottomLeft: Radius.circular(14),
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(width: 8),
            Text(time, style: TextStyle(color: Colors.black54, fontSize: 12)),
          ],
        ),
      );
    }

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
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12),
                  Row(
                    children: [
                      Image.asset('assets/logo.png',
                          width: 26,
                          height: 26,
                          errorBuilder: (c, e, st) => SizedBox.shrink()),
                      SizedBox(width: 8),
                      Text('Smart Agri-Guard',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 18),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 6),
                  children: [
                    alertCard('Plants Tomato need water', '5:11'),
                    alertCard('Plants Tomato need fertilizer', '7:15'),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
