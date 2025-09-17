import 'package:flutter/material.dart';

class FarmerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7B8C5F),
      appBar: AppBar(
        backgroundColor: Color(0xFF7B8C5F),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 32),
            SizedBox(width: 8),
            Text('Smart Agri-Guard', style: TextStyle(color: Colors.white)),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            tooltip: 'Settings',
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
          IconButton(
            tooltip: 'History',
            icon: Image.asset(
              'assets/tag.png',
              width: 28,
              height: 28,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.local_offer, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/plant_history',
                  arguments: {'name': 'Tomato'});
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Text(
              'Greenhouse A',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _plantCard(
                  context,
                  'Tomato',
                  'assets/tomato.jpg',
                  '25°C',
                  '80%',
                  '5.4',
                  '3/4/9',
                  true,
                ),
                SizedBox(height: 24),
                _plantCard(
                  context,
                  'Pepper',
                  'assets/pepper.jpg',
                  '10°C',
                  '30%',
                  '6.4',
                  '5/10/9',
                  false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _plantCard(
    BuildContext context,
    String name,
    String imagePath,
    String temp,
    String humidity,
    String ph,
    String stats,
    bool alert,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/plant_detail', arguments: {
          'name': name,
          'image': imagePath,
          'temp': temp,
          'humidity': humidity,
          'ph': ph,
          'stats': stats,
          'status': alert ? 'alert' : 'healthy',
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF50623A),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child:
                        Image.asset(imagePath, height: 120, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _infoIcon(Icons.thermostat, temp),
                      _infoIcon(Icons.water_drop, humidity),
                      _infoIcon(Icons.science, ph),
                      _infoIcon(Icons.bar_chart, stats),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/alerts', arguments: {
                      'name': name,
                    });
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFE9F5C6),
                    child: Icon(
                      alert
                          ? Icons.notifications_active
                          : Icons.notifications_none,
                      color: alert ? Colors.red : Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/plant_history',
                        arguments: {'name': name, 'image': imagePath});
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFE9F5C6),
                    child: Image.asset('assets/tag.png',
                        width: 18,
                        height: 18,
                        errorBuilder: (c, e, s) =>
                            Icon(Icons.history, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 12),
                CircleAvatar(
                  backgroundColor: Color(0xFFE9F5C6),
                  child: Icon(Icons.edit, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoIcon(IconData icon, String value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFE9F5C6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Color(0xFF50623A)),
          SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              color: Color(0xFF50623A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
