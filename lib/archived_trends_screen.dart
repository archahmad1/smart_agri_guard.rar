import 'package:flutter/material.dart';
import 'dart:math';

class ArchivedTrendsScreen extends StatefulWidget {
  @override
  _ArchivedTrendsScreenState createState() => _ArchivedTrendsScreenState();
}

class _ArchivedTrendsScreenState extends State<ArchivedTrendsScreen> {
  final List<int> _years = List.generate(12, (i) => 2016 + i);
  final List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  int _startYear = DateTime.now().year;
  String _startMonth = 'Apr';
  int _endYear = DateTime.now().year;
  String _endMonth = 'Apr';

  final List<String> _plants = ['Tomato', 'Pepper', 'Potato'];
  String _selectedPlant = 'Tomato';
  Map<String, bool> _metrics = {
    'Temperature': true,
    'Humidity': false,
    'pH': false,
    'Phosphorus': false,
    'Potassium': false,
    'Nitrogen': false,
  };
  bool _showChart = false;

  DateTime get _rangeStart =>
      DateTime(_startYear, _months.indexOf(_startMonth) + 1, 1);
  DateTime get _rangeEnd =>
      DateTime(_endYear, _months.indexOf(_endMonth) + 1, 1)
          .add(Duration(days: 31))
          .subtract(Duration(days: 1));

  void _onShowData() {
    if (!_metrics.containsValue(true)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select at least one metric')));
      return;
    }
    if (_rangeEnd.isBefore(_rangeStart)) {
      final sy = _startYear;
      final sm = _startMonth;
      setState(() {
        _startYear = _endYear;
        _startMonth = _endMonth;
        _endYear = sy;
        _endMonth = sm;
      });
    }
    setState(() => _showChart = true);
  }

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF7B8C5F);
    final panel = Color(0xFFF2EFBF);
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(color: panel, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.black87),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('Smart Agri-Guard',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: panel,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select start',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<int>(
                                  isExpanded: true,
                                  value: _startYear,
                                  items: _years
                                      .map((y) => DropdownMenuItem(
                                          value: y, child: Text(y.toString())))
                                      .toList(),
                                  onChanged: (v) => setState(
                                      () => _startYear = v ?? _startYear),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 8)),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  value: _startMonth,
                                  items: _months
                                      .map((m) => DropdownMenuItem(
                                          value: m, child: Text(m)))
                                      .toList(),
                                  onChanged: (v) => setState(
                                      () => _startMonth = v ?? _startMonth),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 8)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: panel,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select end',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<int>(
                                  isExpanded: true,
                                  value: _endYear,
                                  items: _years
                                      .map((y) => DropdownMenuItem(
                                          value: y, child: Text(y.toString())))
                                      .toList(),
                                  onChanged: (v) =>
                                      setState(() => _endYear = v ?? _endYear),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 8)),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  value: _endMonth,
                                  items: _months
                                      .map((m) => DropdownMenuItem(
                                          value: m, child: Text(m)))
                                      .toList(),
                                  onChanged: (v) => setState(
                                      () => _endMonth = v ?? _endMonth),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 8)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: panel, borderRadius: BorderRadius.circular(12)),
                child: DropdownButton<String>(
                  value: _selectedPlant,
                  isExpanded: true,
                  underline: SizedBox.shrink(),
                  items: _plants
                      .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                      .toList(),
                  onChanged: (v) =>
                      setState(() => _selectedPlant = v ?? _selectedPlant),
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: panel, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 6,
                      children: _metrics.keys.map((k) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                                value: _metrics[k],
                                onChanged: (v) =>
                                    setState(() => _metrics[k] = v ?? false)),
                            SizedBox(width: 4),
                            Text(k),
                          ],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _onShowData,
                        child: Text('Show Data'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12),
              Text('Result', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(12),
                  child: _showChart
                      ? _buildChart()
                      : Center(
                          child: Text(
                              'No data. Select range and metrics, then tap Show Data.')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    final days = max(5, (_rangeEnd.difference(_rangeStart).inDays + 1));
    final points = min(30, days);
    final rnd = Random(_rangeStart.millisecondsSinceEpoch);
    Map<String, List<double>> series = {};
    for (var k in _metrics.keys) {
      if (_metrics[k] == true) {
        series[k] =
            List.generate(points, (i) => 20 + rnd.nextDouble() * (10 + i % 5));
      }
    }

    return CustomPaint(
      size: Size(double.infinity, 200),
      painter: _TrendsPainter(series: series),
      child: Container(),
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
      final maxVal = (values.reduce((a, b) => a > b ? a : b));
      final minVal = (values.reduce((a, b) => a < b ? a : b));
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
