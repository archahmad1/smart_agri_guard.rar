import 'package:flutter/material.dart';

class GenerateReportsScreen extends StatefulWidget {
  @override
  _GenerateReportsScreenState createState() => _GenerateReportsScreenState();
}

class _GenerateReportsScreenState extends State<GenerateReportsScreen> {
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
    'Temperature': false,
    'Humidity': false,
    'pH': false,
    'Phosphorus': false,
    'Potassium': false,
    'Nitrogen': false,
  };

  void _onGenerate() {
    // placeholder: would collect params and generate report
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Generating report...')));
  }

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF7B8C5F);
    final panel = Color(0xFFF2EFBF);
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
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
                Image.asset('assets/logo.png', height: 28),
                SizedBox(width: 8),
                Expanded(
                    child: Text('Smart Agri-Guard',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))),
              ]),

              SizedBox(height: 12),
              Center(
                  child: Text('Greenhouse A',
                      style:
                          TextStyle(color: Color(0xFFEFEFCB), fontSize: 14))),
              SizedBox(height: 16),

              // selectors row
              Row(children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: panel, borderRadius: BorderRadius.circular(12)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select month',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                          SizedBox(height: 8),
                          Row(children: [
                            Expanded(
                              child: DropdownButtonFormField<int>(
                                isExpanded: true,
                                initialValue: _startYear,
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
                                initialValue: _startMonth,
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
                          ]),
                        ]),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: panel, borderRadius: BorderRadius.circular(12)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select month',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                          SizedBox(height: 8),
                          Row(children: [
                            Expanded(
                              child: DropdownButtonFormField<int>(
                                isExpanded: true,
                                initialValue: _endYear,
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
                                initialValue: _endMonth,
                                items: _months
                                    .map((m) => DropdownMenuItem(
                                        value: m, child: Text(m)))
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => _endMonth = v ?? _endMonth),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 8)),
                              ),
                            ),
                          ]),
                        ]),
                  ),
                ),
              ]),

              SizedBox(height: 14),

              // plant selector (styled)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: Color(0xFFE9F5C6),
                    borderRadius: BorderRadius.circular(12)),
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

              // circular-style checkboxes row
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: panel, borderRadius: BorderRadius.circular(12)),
                child: Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: _metrics.keys.map((k) {
                      final checked = _metrics[k] ?? false;
                      return GestureDetector(
                        onTap: () => setState(() => _metrics[k] = !checked),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: checked
                                  ? Color(0xFF50623A)
                                  : Colors.transparent,
                              border: Border.all(color: Color(0xFF50623A)),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(k, style: TextStyle(color: Color(0xFF50623A))),
                        ]),
                      );
                    }).toList()),
              ),

              SizedBox(height: 18),
              Row(children: [
                ElevatedButton(
                  onPressed: _onGenerate,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE9F5C6),
                      foregroundColor: Color(0xFF2C3A1A),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text('Generate'),
                ),
                SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Exporting Excel/PDF...'))),
                  icon: Icon(Icons.picture_as_pdf, size: 18),
                  label: Text('Excel-PDF'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2C3A1A),
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
