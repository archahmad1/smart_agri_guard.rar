import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7B8C5F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Image.asset('assets/logo.png', height: 28),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Smart Agri-Guard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings_admin');
                    },
                  ),
                ],
              ),

              SizedBox(height: 28),
              Text(
                'Admin Panel',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 18),

              // Card list
              _AdminCard(
                title: 'Greenhouse Management',
                subtitle: 'Add-Modify-Delete',
                icon: Icons.park_outlined,
                onTap: () =>
                    Navigator.pushNamed(context, '/manage_greenhouses'),
              ),
              SizedBox(height: 12),
              _AdminCard(
                title: 'Managers Management',
                subtitle: 'Add-Assign-Delete',
                icon: Icons.group_outlined,
                onTap: () => Navigator.pushNamed(context, '/manage_managers'),
              ),
              SizedBox(height: 12),
              _AdminCard(
                title: 'Plant Management',
                subtitle: 'Add-Modify-Delete',
                icon: Icons.local_florist_outlined,
                onTap: () => Navigator.pushNamed(context, '/manage_plants'),
              ),
              SizedBox(height: 12),
              _AdminCard(
                title: 'System Reports',
                subtitle: 'System Issues',
                icon: Icons.report_outlined,
                onTap: () => Navigator.pushNamed(context, '/system_reports'),
              ),

              // spacer
              Expanded(child: Container()),

              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                  child: Text(
                    'LOGOUT',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdminCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _AdminCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFE9F5C6),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFDFE9B3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Color(0xFF2C3A1A)),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF2C3A1A),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Color(0xFF2C3A1A)),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF2C3A1A)),
            ],
          ),
        ),
      ),
    );
  }
}
