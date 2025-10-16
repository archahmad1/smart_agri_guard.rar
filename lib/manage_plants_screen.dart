import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import 'add_plant_screen.dart';
import 'update_plant_screen.dart';
import '../../core/widgets/plant_item.dart'; // separate reusable widget

class ManagePlantsScreen extends StatelessWidget {
  final String greenhouseName;
  ManagePlantsScreen({this.greenhouseName = 'Greenhouse A'});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final outerPadding = size.width * 0.05;
    final bg = AppColors.primaryBackground;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: outerPadding, vertical: size.height * 0.015),
          child: Column(
            children: [
              Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  // Title
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
                        Text(greenhouseName,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ),
                  // Add button
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AddPlantScreen(
                                greenhouseName: greenhouseName))),
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),

              // Plant list
              Expanded(
                child: ListView(
                  children: [
                    PlantItem(
                        name: 'Tomato',
                        image: 'assets/tomato.jpg',
                        size: size,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UpdatePlantScreen(
                                    name: 'Tomato',
                                    greenhouseName: greenhouseName)))),
                    PlantItem(
                        name: 'Potato',
                        image: '', // no image
                        size: size,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UpdatePlantScreen(
                                    name: 'Potato',
                                    greenhouseName: greenhouseName)))),
                    PlantItem(
                        name: 'Pepper',
                        image: 'assets/pepper.jpg',
                        size: size,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UpdatePlantScreen(
                                    name: 'Pepper',
                                    greenhouseName: greenhouseName)))),
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
