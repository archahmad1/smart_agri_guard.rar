import 'dart:math';
import 'package:flutter/material.dart';

class PlantHistoryScreen extends StatefulWidget {
  @override
  _PlantHistoryScreenState createState() => _PlantHistoryScreenState();
}

class _PlantHistoryScreenState extends State<PlantHistoryScreen> {
  DateTime _startDate = DateTime.now().subtract(Duration(days: 7));
  DateTime _endDate = DateTime.now();

  final Map<String, bool> factors = {
    'Temperature': true,
    'Humidity': false,
    'pH': false,
    'Phosphorus': false,
    'Potassium': false,
    'Nitrogen': false,
    'Soil Moisture': false,
  };

  Map<String, List<double>> _seriesMap = {};

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2016),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _startDate) {
      setState(() => _startDate = picked);
    }
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(2016),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _endDate) {
      setState(() => _endDate = picked);
    }
  }

  void _generateSampleChart() {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.orange,
      Colors.green,
      Colors.purple,
      Colors.brown
    ];
    int ci = 0;
    var start = _startDate;
    var end = _endDate;
    if (end.isBefore(start)) {
      final tmp = start;
      start = end;
      end = tmp;
    }
    final days = end.difference(start).inDays + 1;
    final pointsCount = days.clamp(3, 60);

    final rnd = Random(start.millisecondsSinceEpoch);
    Map<String, List<double>> generated = {};
    factors.forEach((k, v) {
      if (v) {
        generated[k] =
            List.generate(pointsCount, (i) => 20 + rnd.nextDouble() * 10);
        ci++;
      }
    });
    setState(() {
      _seriesMap = generated;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final name = args?['name'] ?? 'Tomato';

    return Scaffold(
      backgroundColor: Color(0xFF7B8C5F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Column(
            children: [
              // header
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xFFE9F5C6), shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Color(0xFF50623A)),
                    ),
                  ),
                  SizedBox(width: 12),
                  Image.asset('assets/logo.png', height: 28),
                  SizedBox(width: 8),
                  Expanded(
                      child: Text('Smart Agri-Guard',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              ),
              SizedBox(height: 10),
              Text(name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 14),

              // Date range pickers
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _pickStartDate,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Color(0xFFE9F5C6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Start Date',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF50623A))),
                            SizedBox(height: 6),
                            Text(
                              "${_startDate.day}-${_startDate.month}-${_startDate.year}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3A1A)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: _pickEndDate,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Color(0xFFE9F5C6),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('End Date',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFF50623A))),
                            SizedBox(height: 6),
                            Text(
                              "${_endDate.day}-${_endDate.month}-${_endDate.year}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3A1A)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),

              // Factor selector
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFE9F5C6),
                    borderRadius: BorderRadius.circular(12)),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: factors.keys.map((k) {
                    return Row(mainAxisSize: MainAxisSize.min, children: [
                      Checkbox(
                          value: factors[k],
                          onChanged: (v) =>
                              setState(() => factors[k] = v ?? false),
                          activeColor: Color(0xFF50623A)),
                      SizedBox(width: 6),
                      Text(k, style: TextStyle(color: Color(0xFF50623A)))
                    ]);
                  }).toList(),
                ),
              ),

              SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2C3A1A),
                    foregroundColor: Color(0xFFE9F5C6),
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _generateSampleChart,
                  child: Text('Show Data'),
                ),
              ),

              SizedBox(height: 12),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Result',
                      style: TextStyle(color: Colors.white, fontSize: 16))),
              SizedBox(height: 8),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: _seriesMap.isEmpty
                        ? Center(
                            child: Text('Chart will appear here',
                                style: TextStyle(color: Color(0xFF50623A))))
                        : CustomPaint(
                            size: Size(double.infinity, 200),
                            painter: _TrendsPainter(series: _seriesMap),
                          ),
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

class _TrendsPainter extends CustomPainter {
  final Map<String, List<double>> series;
  _TrendsPainter({required this.series});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final axis = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1;
    final w = size.width;
    final h = size.height;

    // Draw axes
    canvas.drawLine(Offset(40, 10), Offset(40, h - 30), axis);
    canvas.drawLine(Offset(40, h - 30), Offset(w - 10, h - 30), axis);

    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.brown
    ];
    int ci = 0;
    series.forEach((name, values) {
      final path = Path();
      final maxVal = values.reduce(max);
      final minVal = values.reduce(min);
      for (var i = 0; i < values.length; i++) {
        final x = 40 + ((w - 60) * (i / max(1, values.length - 1)));
        final norm = (values[i] - minVal) / max(1e-6, (maxVal - minVal));
        final y = (h - 30) - ((h - 50) * norm);
        if (i == 0)
          path.moveTo(x, y);
        else
          path.lineTo(x, y);
      }
      paint.color = colors[ci % colors.length];
      canvas.drawPath(path, paint);
      ci++;
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
