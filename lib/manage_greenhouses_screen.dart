import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import 'add_greenhouse_screen.dart';
import 'update_greenhouse_screen.dart';
import 'greenhouse_detail_screen.dart';
import '../../core/widgets/GHItem.dart';

class ManageGreenhousesScreen extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
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
                      padding: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.02),

              // List of greenhouses
              Expanded(
                child: ListView(
                  children: [
                    GHItem(
                      name: 'Greenhouse A',
                      image: 'assets/Greenhouse.png',
                      location: 'North Field',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              GreenhouseDetailScreen(name: 'Greenhouse A'),
                        ),
                      ),
                      onEdit: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              UpdateGreenhouseScreen(name: 'Greenhouse A'),
                        ),
                      ),
                      size: size,
                    ),
                    GHItem(
                      name: 'Greenhouse B',
                      image: 'assets/Greenhouse.png',
                      location: 'South Zone',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              GreenhouseDetailScreen(name: 'Greenhouse B'),
                        ),
                      ),
                      onEdit: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              UpdateGreenhouseScreen(name: 'Greenhouse B'),
                        ),
                      ),
                      size: size,
                    ),
                    GHItem(
                      name: 'Greenhouse C',
                      image: 'assets/Greenhouse.png',
                      location: 'East Side',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              GreenhouseDetailScreen(name: 'Greenhouse C'),
                        ),
                      ),
                      onEdit: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              UpdateGreenhouseScreen(name: 'Greenhouse C'),
                        ),
                      ),
                      size: size,
                    ),
                    GHItem(
                      name: 'Greenhouse D',
                      image: 'assets/Greenhouse.png',
                      location: 'West End',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              GreenhouseDetailScreen(name: 'Greenhouse D'),
                        ),
                      ),
                      onEdit: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              UpdateGreenhouseScreen(name: 'Greenhouse D'),
                        ),
                      ),
                      size: size,
                    ),
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
