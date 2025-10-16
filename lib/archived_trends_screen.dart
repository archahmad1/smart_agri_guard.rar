import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

class ArchivedTrendsScreen extends StatefulWidget {
  @override
  _ArchivedTrendsScreenState createState() => _ArchivedTrendsScreenState();
}

class _ArchivedTrendsScreenState extends State<ArchivedTrendsScreen> {
  DateTime _startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime _endDate = DateTime.now();

  final List<String> _plants = ['Tomato', 'Pepper', 'Potato'];
  String _selectedPlant = 'Tomato';

  Map<String, bool> _metrics = {
    'Temperature': true,
    'Humidity': false,
    'pH': false,
    'Phosphorus': false,
    'Potassium': false,
    'Nitrogen': false,
    'Soil Moisture': false,
  };

  bool _showChart = false;
  Map<String, List<FlSpot>> _series = {};

  Future<void> _pickStartDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2016),
      lastDate: DateTime.now(),
    );
    if (date != null) setState(() => _startDate = date);
  }

  Future<void> _pickEndDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(2016),
      lastDate: DateTime.now(),
    );
    if (date != null) setState(() => _endDate = date);
  }

  void _onShowData() {
    if (!_metrics.containsValue(true)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select at least one metric')));
      return;
    }
    if (_endDate.isBefore(_startDate)) {
      final temp = _startDate;
      setState(() {
        _startDate = _endDate;
        _endDate = temp;
      });
    }

    final days = max(5, _endDate.difference(_startDate).inDays + 1);
    final rnd = Random(_startDate.millisecondsSinceEpoch);
    _series.clear();

    int ci = 0;
    _metrics.forEach((key, value) {
      if (value) {
        List<FlSpot> spots = [];
        for (var i = 0; i < days; i++) {
          spots.add(FlSpot(i.toDouble(), 20 + rnd.nextDouble() * (10 + i % 5)));
        }
        _series[key] = spots;
        ci++;
      }
    });

    setState(() => _showChart = true);
  }

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF7B8C5F);
    final panel = Color(0xFFF2EFBF);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: panel,
        foregroundColor: Colors.black87,
        title: const Text('Archived Trends',
            style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildDateSelector(
                        'Start Date', _startDate, _pickStartDate),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child:
                        _buildDateSelector('End Date', _endDate, _pickEndDate),
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
                  onChanged: (v) => setState(() => _selectedPlant = v!),
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
                                  setState(() => _metrics[k] = v!),
                            ),
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
                      ? LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: max(
                                      1,
                                      (_endDate.difference(_startDate).inDays /
                                          5)),
                                  getTitlesWidget: (value, meta) {
                                    final date = _startDate
                                        .add(Duration(days: value.toInt()));
                                    return Text('${date.month}/${date.day}',
                                        style: TextStyle(fontSize: 10));
                                  },
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: true),
                              ),
                            ),
                            lineBarsData: _series.entries
                                .map((e) => LineChartBarData(
                                      spots: e.value,
                                      isCurved: true,
                                      dotData: FlDotData(show: false),
                                      color: Colors.primaries[_metrics.keys
                                              .toList()
                                              .indexOf(e.key) %
                                          Colors.primaries.length],
                                    ))
                                .toList(),
                            gridData: FlGridData(show: true),
                            borderData: FlBorderData(show: true),
                          ),
                        )
                      : Center(
                          child: Text(
                            'No data. Select range and metrics, then tap Show Data.',
                            style: TextStyle(color: Colors.black45),
                            textAlign: TextAlign.center,
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

  Widget _buildDateSelector(String label, DateTime date, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Color(0xFFF2EFBF), borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 12, color: Colors.black54)),
            SizedBox(height: 6),
            Text(
                '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
