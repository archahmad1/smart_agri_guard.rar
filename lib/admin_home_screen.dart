import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF7B8C5F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B8C5F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 30,
              errorBuilder: (c, e, s) =>
                  const Icon(Icons.agriculture, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Text(
              'Smart Agri-Guard',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
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
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? size.width * 0.15 : 20,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Admin Panel',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),

              // Cards list
              Expanded(
                child: ListView(
                  children: [
                    _AdminCard(
                      title: 'Greenhouse Management',
                      subtitle: 'Add - Modify - Delete',
                      icon: Icons.house_siding_rounded,
                      onTap: () =>
                          Navigator.pushNamed(context, '/manage_greenhouses'),
                    ),
                    const SizedBox(height: 14),
                    _AdminCard(
                      title: 'Managers Management',
                      subtitle: 'Add - Modify - Delete',
                      icon: Icons.people_alt_outlined,
                      onTap: () =>
                          Navigator.pushNamed(context, '/manage_managers'),
                    ),
                    const SizedBox(height: 14),
                    _AdminCard(
                      title: 'Plant Type Management',
                      subtitle: 'Add - Modify - Delete',
                      icon: Icons.local_florist_outlined,
                      onTap: () =>
                          Navigator.pushNamed(context, '/manage_plants_Type'),
                    ),
                    const SizedBox(height: 14),
                    _AdminCard(
                      title: 'System Reports',
                      subtitle: 'System Issues & Logs',
                      icon: Icons.insert_chart_outlined,
                      onTap: () =>
                          Navigator.pushNamed(context, '/system_reports'),
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
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE9F5C6),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFDFE9B3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: const Color(0xFF2C3A1A), size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF2C3A1A),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF2C3A1A),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  size: 18, color: Color(0xFF2C3A1A)),
            ],
          ),
        ),
      ),
    );
  }
}
