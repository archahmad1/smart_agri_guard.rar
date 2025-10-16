import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';

class ManageAssignmentScreen extends StatefulWidget {
  final String greenhouseName;
  const ManageAssignmentScreen({super.key, required this.greenhouseName});

  @override
  State<ManageAssignmentScreen> createState() => _ManageAssignmentScreenState();
}

class _ManageAssignmentScreenState extends State<ManageAssignmentScreen> {
  bool hasManager = true; // simulate assignment state
  String? selectedManager;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Manage Assignment',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greenhouse name
              Text(
                'Greenhouse: ${widget.greenhouseName}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 20),

              // Main content (assigned or unassigned)
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: hasManager ? _assignedView() : _unassignedView(),
              ),

              const SizedBox(height: 30),

              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save, color: Colors.white),
                  label: const Text('Save',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Changes saved successfully!'),
                        backgroundColor: Color(0xFF50623A),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButton,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // When there is a manager
  Widget _assignedView() {
    return Column(
      key: const ValueKey('assigned'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Current Manager:',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John Doe',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('JohnUsername',
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
              Icon(Icons.person, color: Colors.black54, size: 26),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.remove_circle, color: Colors.white),
            label: const Text(
              'Unassign Manager',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  backgroundColor: const Color(0xFFEFF6C9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  title: const Text(
                    'Confirm Unassignment',
                    style: TextStyle(
                        color: Color(0xFF50623A), fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                    'Are you sure you want to unassign this manager?',
                    style: TextStyle(color: Colors.black87),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color(0xFF50623A),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () => Navigator.of(ctx).pop(true),
                      child: const Text('Unassign',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                setState(() => hasManager = false);
              }
            },
          ),
        ),
      ],
    );
  }

  // When no manager assigned
  Widget _unassignedView() {
    return Column(
      key: const ValueKey('unassigned'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'No manager assigned.',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 16),
        const Text(
          'Assign Manager',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: selectedManager,
          hint: const Text('Select a manager'),
          items: ['Alice Smith', 'Bob Johnson', 'Charlie White']
              .map((name) => DropdownMenuItem(value: name, child: Text(name)))
              .toList(),
          onChanged: (v) => setState(() => selectedManager = v),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.inputBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
