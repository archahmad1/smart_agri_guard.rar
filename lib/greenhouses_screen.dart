import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import 'plants_screen.dart';

class GreenhousesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final outerPadding = size.width * 0.05; // dynamic padding
    final bg = AppColors.primaryBackground;

    Widget greenhouseCard(String imageAsset, String name, String location) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PlantsScreen(greenhouseName: name),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.015),
          decoration: BoxDecoration(
            color: bg.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 6, offset: Offset(0, 4))
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.03),
            child: Column(
              children: [
                // Inset white area with rounded image
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageAsset,
                      height: size.height * 0.25, // dynamic height
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, st) => Container(
                        height: size.height * 0.25,
                        color: Colors.grey[200],
                        child: Icon(Icons.agriculture,
                            size: 64, color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // left chip
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.008),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.008),
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
      );
    }

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: outerPadding, vertical: size.height * 0.015),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01),
              // Title area with back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/logo.png',
                                width: size.width * 0.06,
                                height: size.width * 0.06,
                                errorBuilder: (c, e, st) => SizedBox.shrink()),
                            SizedBox(width: size.width * 0.02),
                            Text('Smart Agri-Guard',
                                style: AppTextStyles.title.copyWith(
                                    fontSize: 18, color: Colors.white)),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                        Text('Greenhouses',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),

              // list
              Expanded(
                child: ListView(
                  children: [
                    greenhouseCard(
                        'assets/pepper.jpg', 'Greenhouse A', 'Amman'),
                    greenhouseCard(
                        'assets/tomato.jpg', 'Greenhouse B', 'Irbid'),
                    SizedBox(height: size.height * 0.03),
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
