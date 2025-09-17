import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  List<Map<String, String>> alerts = [
    {
      'text': 'Plants Tomato need water',
      'time': '5:11',
      'name': 'Tomato',
      'image': 'assets/tomato.jpg',
      'temp': '25°C',
      'humidity': '80%',
      'read': 'false'
    },
    {
      'text': 'Plants Tomato need fertilizer',
      'time': '7:15',
      'name': 'Tomato',
      'image': 'assets/tomato.jpg',
      'temp': '25°C',
      'humidity': '80%',
      'read': 'false'
    },
  ];

  void _clearAlerts() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('Clear all alerts'),
        content: Text('Are you sure you want to remove all alerts?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(c, false), child: Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(c, true), child: Text('Clear')),
        ],
      ),
    );
    if (ok == true) setState(() => alerts.clear());
  }

  void _markAllRead() {
    setState(() {
      for (var a in alerts) a['read'] = 'true';
    });
  }

  void _openFirstAlertDetail() {
    if (alerts.isEmpty) return;
    final a = alerts.first;
    Navigator.pushNamed(context, '/plant_detail', arguments: {
      'name': a['name'],
      'image': a['image'],
      'temp': a['temp'],
      'humidity': a['humidity'],
      'ph': '5.4',
      'stats': '3/4/9',
      'status': 'alert',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7B8C5F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (c) {
                          return SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.mark_email_read),
                                  title: Text('Mark all read'),
                                  onTap: () {
                                    Navigator.pop(c);
                                    _markAllRead();
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.delete_forever),
                                  title: Text('Clear all alerts'),
                                  onTap: () {
                                    Navigator.pop(c);
                                    _clearAlerts();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Color(0xFFF2EFBF), shape: BoxShape.circle),
                      child: Icon(Icons.notifications, color: Colors.black87),
                    ),
                  ),
                  InkWell(
                    onTap: _openFirstAlertDetail,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Color(0xFFF2EFBF), shape: BoxShape.circle),
                      child: Icon(Icons.open_in_new, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0xFFE9F5C6),
                                  shape: BoxShape.circle),
                              child: Icon(Icons.arrow_back,
                                  color: Color(0xFF50623A)),
                            ),
                          ),
                          SizedBox(width: 12),
                          Image.asset('assets/logo.png', height: 28),
                          SizedBox(width: 8),
                          Text('Smart Agri-Guard',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: alerts.isEmpty
                            ? Center(
                                child: Text('No alerts',
                                    style: TextStyle(color: Colors.white70)),
                              )
                            : ListView.separated(
                                itemCount: alerts.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 14),
                                itemBuilder: (ctx, i) {
                                  final a = alerts[i];
                                  return _alertCard(a, () {
                                    setState(() => a['read'] = 'true');
                                    Navigator.pushNamed(
                                        context, '/plant_detail',
                                        arguments: {
                                          'name': a['name'],
                                          'image': a['image'],
                                          'temp': a['temp'],
                                          'humidity': a['humidity'],
                                          'ph': '5.4',
                                          'stats': '3/4/9',
                                          'status': 'alert',
                                        });
                                  });
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _alertCard(Map<String, String> a, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFEFF6C9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(a['text'] ?? '',
                    style: TextStyle(
                        color: Color(0xFF50623A),
                        fontWeight: FontWeight.bold))),
            Text(a['time'] ?? '', style: TextStyle(color: Color(0xFF50623A))),
          ],
        ),
      ),
    );
  }
}
