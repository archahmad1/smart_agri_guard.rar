import 'package:flutter/material.dart';

class ManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color(0xFF6B8A4A);
    final cardColor = Color(0xFFF2EFBF);
    final titleStyle = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
    final cardTextStyle = TextStyle(
        color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600);

    Widget actionCard(
        IconData icon, String title, String subtitle, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 30, color: Colors.black87),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: cardTextStyle),
                    SizedBox(height: 4),
                    Text(subtitle,
                        style: TextStyle(color: Colors.black54, fontSize: 12)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
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
                        color: cardColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.black87),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/logo.png',
                              width: 28,
                              height: 28,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                    color: Colors.white24,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.agriculture,
                                    size: 18, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text('Smart Agri-Guard', style: titleStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                  ),
                ],
              ),
              SizedBox(height: 18),
              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _SmallStat(count: '3', label: 'Greenhouses'),
                        SizedBox(width: 8),
                        _SmallStat(count: '24', label: 'Plants'),
                        SizedBox(width: 8),
                        _SmallStat(count: '2', label: 'Alerts'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        _QuickButton(
                            icon: Icons.park,
                            label: 'Greenhouses',
                            onTap: () =>
                                Navigator.pushNamed(context, '/greenhouses')),
                        SizedBox(width: 8),
                        _QuickButton(
                            icon: Icons.people_alt,
                            label: 'Farmers',
                            onTap: () => Navigator.pushNamed(
                                context, '/manage_farmers')),
                        SizedBox(width: 8),
                        _QuickButton(
                            icon: Icons.notifications,
                            label: 'Reports',
                            onTap: () => Navigator.pushNamed(
                                context, '/system_reports')),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/greenhouses'),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(Icons.park, color: Colors.black87),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                          child: Text('Greenhouses',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600))),
                      Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.black54),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    actionCard(
                        Icons.people_alt, 'Manage Farmers', 'Add-Modify-Delete',
                        () {
                      Navigator.pushNamed(context, '/manage_farmers');
                    }),
                    SizedBox(height: 12),
                    actionCard(
                        Icons.insert_chart_outlined, 'Generate Reports', '',
                        () {
                      Navigator.pushNamed(context, '/generate_reports');
                    }),
                    SizedBox(height: 12),
                    actionCard(Icons.archive, 'View Archived Sensor Trends', '',
                        () {
                      Navigator.pushNamed(context, '/archived_trends');
                    }),
                    SizedBox(height: 12),
                    actionCard(
                        Icons.computer, 'System Reports', 'System Issues', () {
                      Navigator.pushNamed(context, '/system_reports');
                    }),
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

class _SmallStat extends StatelessWidget {
  final String count;
  final String label;

  const _SmallStat({Key? key, required this.count, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(count,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 20),
              SizedBox(height: 6),
              Text(label,
                  style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
