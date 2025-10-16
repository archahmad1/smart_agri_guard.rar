import 'package:flutter/material.dart';

class FarmerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.04;

    return Scaffold(
      backgroundColor: const Color(0xFF7B8C5F),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.08),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF7B8C5F),
          elevation: 0,
          titleSpacing: 16,
          title: Row(
            children: [
              Image.asset(
                'assets/logo.png',
                height: size.height * 0.05,
                fit: BoxFit.contain,
              ),
              SizedBox(width: size.width * 0.02),
              Text(
                'Smart Agri-Guard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              tooltip: 'Settings',
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            ),
            SizedBox(width: size.width * 0.02),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Greenhouse A',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Expanded(
                child: ListView(
                  children: [
                    _plantCard(
                      context,
                      size,
                      'Tomato',
                      'assets/tomato.jpg',
                      '25°C',
                      '80%',
                      '5.4',
                      '3/4/9',
                      true,
                    ),
                    SizedBox(height: size.height * 0.03),
                    _plantCard(
                      context,
                      size,
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
        ),
      ),
    );
  }

  Widget _plantCard(
    BuildContext context,
    Size size,
    String name,
    String imagePath,
    String temp,
    String humidity,
    String ph,
    String stats,
    bool alert,
  ) {
    final cardPadding = size.width * 0.025;

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
        padding: EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: const Color(0xFF50623A),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image & Info Section
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      imagePath,
                      height: size.height * 0.18,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: size.width * 0.015,
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
            SizedBox(width: size.width * 0.02),
            // Alert & History Buttons
            Column(
              children: [
                SizedBox(height: size.height * 0.01),
                _circleButton(
                  context,
                  alert ? Icons.notifications_active : Icons.notifications_none,
                  alert ? Colors.red : Colors.black,
                  () => Navigator.pushNamed(context, '/alerts',
                      arguments: {'name': name}),
                ),
                SizedBox(height: size.height * 0.02),
                _circleButton(
                  context,
                  Icons.history,
                  Colors.black,
                  () => Navigator.pushNamed(context, '/plant_history',
                      arguments: {'name': name, 'image': imagePath}),
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
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F5C6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF50623A)),
          const SizedBox(width: 4),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF50623A),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(
    BuildContext context,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(30),
      child: CircleAvatar(
        backgroundColor: const Color(0xFFE9F5C6),
        child: Icon(icon, color: color),
      ),
    );
  }
}
