import 'package:flutter/material.dart';

class AddPlantTypeScreen extends StatefulWidget {
  const AddPlantTypeScreen({super.key});

  @override
  State<AddPlantTypeScreen> createState() => _AddPlantTypeScreenState();
}

class _AddPlantTypeScreenState extends State<AddPlantTypeScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  void _save() {
    if (_nameController.text.trim().isEmpty) return;
    Navigator.pop(context, {
      'name': _nameController.text.trim(),
      'description': _descController.text.trim(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final bg = const Color(0xFF7B8C5F);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Add Plant Type',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Plant Type Name
              const Text('Plant Type Name',
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 6),
              TextField(
                controller: _nameController,
                style: const TextStyle(color: Color(0xFF2C3A1A)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE9F5C6),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  hintText: 'Enter plant type name',
                ),
              ),
              const SizedBox(height: 20),

              // Description
              const Text('Description (optional)',
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 6),
              TextField(
                controller: _descController,
                maxLines: 3,
                style: const TextStyle(color: Color(0xFF2C3A1A)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE9F5C6),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  hintText: 'Enter description',
                ),
              ),
              const SizedBox(height: 40),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2C3A1A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Save',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
