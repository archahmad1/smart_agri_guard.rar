import 'package:flutter/material.dart';

class PlantsScreen extends StatelessWidget {
  final String greenhouseName;

  PlantsScreen({this.greenhouseName = 'Greenhouse A'});

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF6B8A4A);
    final cardBg = Color(0xFF2F3F2A);
    final panelColor = Color(0xFFF2EFBF);

    Widget plantCard(String imageAsset, String title, String temp,
        String humidity, String ph, String dates) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: bg.withOpacity(0.04),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imageAsset,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, st) => Container(
                          height: 160,
                          color: Colors.grey[300],
                          child: Icon(Icons.agriculture,
                              size: 48, color: Colors.grey[700]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4),
                      child: Row(
                        children: [
                          _statCircle(temp),
                          SizedBox(width: 8),
                          _statCircle(humidity),
                          SizedBox(width: 8),
                          _statCircle(ph),
                          SizedBox(width: 8),
                          _statCircle(dates),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    void _openAlerts() => Navigator.pushNamed(context, '/alerts');

    void _openFirstPlantDetail() {
      Navigator.pushNamed(context, '/plant_detail', arguments: {
        'name': 'Tomato',
        'image': 'assets/tomato.jpg',
        'temp': '25°C',
        'humidity': '80%',
        'ph': '6.4',
        'stats': '3/4/9',
        'status': 'ok',
      });
    }

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 8),
                  InkWell(
                    onTap: _openAlerts,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: panelColor, shape: BoxShape.circle),
                      child: Icon(Icons.notifications, color: Colors.black87),
                    ),
                  ),
                  InkWell(
                    onTap: _openFirstPlantDetail,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: panelColor, shape: BoxShape.circle),
                      child: Icon(Icons.open_in_new, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).maybePop(),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: panelColor, shape: BoxShape.circle),
                            child:
                                Icon(Icons.arrow_back, color: Colors.black87),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text('Smart Agri-Guard',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 12),
                        Text(greenhouseName,
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    SizedBox(height: 14),
                    Expanded(
                      child: ListView(
                        children: [
                          plantCard('assets/tomato.jpg', 'Tomato', '25°C',
                              '80%', '6.4', '3/4/9'),
                          plantCard('assets/pepper.jpg', 'Pepper', '19°C',
                              '80%', '6.4', '5/10/9'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCircle(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: Color(0xFFF2EFBF), shape: BoxShape.circle),
      child: Text(text, style: TextStyle(fontSize: 12)),
    );
  }
}
