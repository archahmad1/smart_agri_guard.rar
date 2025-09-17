import 'package:flutter/material.dart';
import 'plants_screen.dart';

class GreenhousesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF6B8A4A);
    final outerPadding = 18.0;

    Widget greenhouseCard(String imageAsset, String name, String location) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PlantsScreen(greenhouseName: name)),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: bg.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 6, offset: Offset(0, 4))
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                // inset white area with rounded image
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageAsset,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, st) => Container(
                        height: 200,
                        color: Colors.grey[200],
                        child: Icon(Icons.agriculture,
                            size: 64, color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // left chip
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.yellow[700],
                                shape: BoxShape.circle),
                            child: Icon(Icons.label,
                                size: 14, color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Text(name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),

                    // right chip
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.blue[300],
                                shape: BoxShape.circle),
                            child: Icon(Icons.location_on,
                                size: 14, color: Colors.white),
                          ),
                          SizedBox(width: 8),
                          Text(location,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ); // end of GestureDetector
    }

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: outerPadding, vertical: 12),
          child: Column(
            children: [
              SizedBox(height: 6),
              // title area with back button
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        SizedBox(height: 6),
                        Text('Greenhouses',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              // list
              Expanded(
                child: ListView(
                  children: [
                    greenhouseCard(
                        'assets/pepper.jpg', 'Greenhouse A', 'Amman'),
                    greenhouseCard(
                        'assets/tomato.jpg', 'Greenhouse B', 'Irbid'),
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
