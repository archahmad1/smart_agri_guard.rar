import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';

class GenerateReportsScreen extends StatefulWidget {
  @override
  _GenerateReportsScreenState createState() => _GenerateReportsScreenState();
}

class _GenerateReportsScreenState extends State<GenerateReportsScreen> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  final Map<String, bool> _selectedPlants = {
    'Tomato': true,
    'Pepper': false,
    'Potato': false,
  };

  Map<String, bool> _metrics = {
    'Temperature': false,
    'Humidity': false,
    'pH': false,
    'Phosphorus': false,
    'Potassium': false,
    'Nitrogen': false,
    'Soil Moisture': false,
  };

  String _reportType = 'PDF'; // or 'Excel'

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2016),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _startDate = picked);
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: DateTime(2016),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _endDate = picked);
  }

  void _onGenerate() {
    final selectedPlants = _selectedPlants.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();
    final selectedMetrics = _metrics.entries
        .where((e) => e.value)
        .map((e) => e.key)
        .toList();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Generating $_reportType report for ${selectedPlants.join(', ')} with metrics ${selectedMetrics.join(', ')} from ${_startDate.day}-${_startDate.month}-${_startDate.year} to ${_endDate.day}-${_endDate.month}-${_endDate.year}')));
  }

  @override
  Widget build(BuildContext context) {
    final bg = AppColors.primaryBackground;
    final panel = AppColors.inputBackground;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header
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
                          Image.asset('assets/logo.png', height: 28),
                          SizedBox(width: 8),
                          Expanded(
                              child: Text('Smart Agri-Guard',
                                  style: AppTextStyles.title
                                      .copyWith(color: Colors.white, fontSize: 18))),
                        ],
                      ),
                      SizedBox(height: 12),

                      // Greenhouse Label
                      Center(
                          child: Text('Greenhouse A',
                              style: TextStyle(color: Colors.white70, fontSize: 14))),
                      SizedBox(height: 16),

                      // Date pickers
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: _pickStartDate,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: panel,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Start Date',
                                        style: TextStyle(fontSize: 12, color: Colors.black54)),
                                    SizedBox(height: 8),
                                    Text(
                                        "${_startDate.day}-${_startDate.month}-${_startDate.year}",
                                        style: AppTextStyles.button),
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
                                    color: panel,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('End Date',
                                        style: TextStyle(fontSize: 12, color: Colors.black54)),
                                    SizedBox(height: 8),
                                    Text("${_endDate.day}-${_endDate.month}-${_endDate.year}",
                                        style: AppTextStyles.button),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14),

                      // Plants selector
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: panel, borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select Plants',
                                style: TextStyle(fontSize: 12, color: Colors.black54)),
                            SizedBox(height: 8),
                            Wrap(
                              spacing: 12,
                              runSpacing: 8,
                              children: _selectedPlants.keys.map((plant) {
                                final checked = _selectedPlants[plant] ?? false;
                                return GestureDetector(
                                  onTap: () => setState(() => _selectedPlants[plant] = !checked),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: checked ? AppColors.primaryButton : Colors.transparent,
                                          border: Border.all(color: AppColors.primaryButton),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(plant, style: TextStyle(color: AppColors.primaryButton)),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 14),

                      // Metrics selector
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: panel, borderRadius: BorderRadius.circular(12)),
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: _metrics.keys.map((metric) {
                            final checked = _metrics[metric] ?? false;
                            return GestureDetector(
                              onTap: () => setState(() => _metrics[metric] = !checked),
                              child: Row(mainAxisSize: MainAxisSize.min, children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: checked ? AppColors.primaryButton : Colors.transparent,
                                    border: Border.all(color: AppColors.primaryButton),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(metric, style: TextStyle(color: AppColors.primaryButton)),
                              ]),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 18),

                      // Report type selector
                      Row(
                        children: ['PDF', 'Excel'].map((type) {
                          final selected = _reportType == type;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _reportType = type),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                margin: EdgeInsets.only(
                                    right: type == 'PDF' ? 6 : 0,
                                    left: type == 'Excel' ? 6 : 0),
                                decoration: BoxDecoration(
                                  color: selected ? AppColors.primaryButton : panel,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                    child: Text(type,
                                        style: AppTextStyles.button.copyWith(
                                            color: selected ? AppColors.buttonText : AppColors.primaryButton))),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 18),

                      // Generate button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _onGenerate,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryButton,
                              foregroundColor: AppColors.buttonText,
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Text('Generate', style: AppTextStyles.button),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
