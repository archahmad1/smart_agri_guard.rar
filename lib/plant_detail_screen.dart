import 'package:flutter/material.dart';

class PlantDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final name = args?['name'] ?? 'Plant';
    final image = args?['image'] ?? 'assets/tomato.jpg';
    final temp = args?['temp'] ?? 'N/A';
    final humidity = args?['humidity'] ?? 'N/A';
    final ph = args?['ph'] ?? 'N/A';
    final stats = args?['stats'] ?? 'N/A';
    final status = args?['status'] ?? 'healthy';

    return Scaffold(
      backgroundColor: Color(0xFF7B8C5F),
      appBar: AppBar(
        backgroundColor: Color(0xFF7B8C5F),
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 28),
            SizedBox(width: 8),
            Text('Smart Agri-Guard', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image, height: 180, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.label, color: Colors.amber),
                SizedBox(width: 8),
                Text(name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.circle,
                    color: status == 'healthy' ? Colors.green : Colors.red,
                    size: 14),
                SizedBox(width: 8),
                Text('status: $status', style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _statItem(Icons.thermostat, temp),
                _statItem(Icons.grass, humidity),
                _statItem(Icons.opacity, ph),
                _statItem(Icons.show_chart, stats),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.lightbulb, color: Colors.yellow[700]),
                SizedBox(width: 8),
                Expanded(
                    child: Text('Alit is recommended to irrigate now',
                        style: TextStyle(color: Colors.white))),
              ],
            ),
            SizedBox(height: 18),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/plant_history',
                      arguments: {'name': name, 'image': image});
                },
                icon: Icon(Icons.history, color: Color(0xFFE9F5C6)),
                label: Text('View History',
                    style: TextStyle(color: Color(0xFFE9F5C6))),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2C3A1A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Color(0xFFE9F5C6)),
        SizedBox(width: 6),
        Text(text,
            style: TextStyle(
                color: Color(0xFFE9F5C6), fontWeight: FontWeight.bold)),
      ],
    );
  }
}
