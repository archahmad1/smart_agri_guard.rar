import 'package:flutter/material.dart';

class UpdatePlantTypeScreen extends StatefulWidget {
  final String initialName;
  final String initialDescription;

  const UpdatePlantTypeScreen({
    super.key,
    required this.initialName,
    required this.initialDescription,
  });

  @override
  State<UpdatePlantTypeScreen> createState() => _UpdatePlantTypeScreenState();
}

class _UpdatePlantTypeScreenState extends State<UpdatePlantTypeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _descController = TextEditingController(text: widget.initialDescription);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7B8C5F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B8C5F),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Update Plant Type',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // ✅ Make content scrollable + safe
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Plant Type Name',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _nameController,
                  style: const TextStyle(color: Color(0xFF2C3A1A)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFE9F5C6),
                    hintText: 'Enter plant type name',
                    hintStyle: const TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.local_florist,
                        color: Color(0xFF50623A)),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  'Description (optional)',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _descController,
                  maxLines: 3,
                  style: const TextStyle(color: Color(0xFF2C3A1A)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFE9F5C6),
                    hintText: 'Enter description (optional)',
                    hintStyle: const TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon:
                        const Icon(Icons.description, color: Color(0xFF50623A)),
                  ),
                ),

                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE9F5C6),
                      padding: const EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (_nameController.text.trim().isEmpty) return;
                      Navigator.pop(context, {
                        'name': _nameController.text,
                        'description': _descController.text,
                      });
                    },
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(
                        color: Color(0xFF50623A),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // space for bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}
