import 'package:flutter/material.dart';

class SystemReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF7B8C5F);
    final cardBg = Color(0xFFF2EFBF);

    Widget reportCard(String text, String time) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(text,
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w600))),
            Text(time, style: TextStyle(color: Colors.black54)),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(color: cardBg, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.black87),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('Smart Agri-Guard',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 18),
              Text('System Reports',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    reportCard(
                        'There is a defect in AI Prediction Model', '6:00'),
                    reportCard(
                        'There is a defect in the NPK sensor in Greenhouse A',
                        '8:00'),
                    reportCard(
                        'There is a defect in the pH sensor in Greenhouse B',
                        '9:00'),
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
