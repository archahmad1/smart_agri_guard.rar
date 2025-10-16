import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePlantScreen extends StatefulWidget {
  final String name;
  final String greenhouseName;
  const UpdatePlantScreen({
    required this.name,
    this.greenhouseName = 'Greenhouse A',
    Key? key,
  }) : super(key: key);

  @override
  _UpdatePlantScreenState createState() => _UpdatePlantScreenState();
}

class _UpdatePlantScreenState extends State<UpdatePlantScreen> {
  late TextEditingController _name;
  String? _plantType = 'Tomato';
  final TextEditingController _image =
      TextEditingController(text: 'tomato.png');
  final TextEditingController _location =
      TextEditingController(text: 'Right side of the greenhouse');
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.name);
  }

  Future<void> _pickImage() async {
    final XFile? file =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    if (file != null) {
      setState(() {
        _pickedImage = File(file.path);
        _image.text = file.name;
      });
    }
  }

  void _save() => Navigator.of(context).pop();
  void _delete() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    const Color background = Color(0xFF6B8A4A);
    const Color lightGreen = Color(0xFFE9F5C6);
    const Color darkGreen = Color(0xFF2C3A1A);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white24,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_back,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          widget.greenhouseName,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Title
                    const Center(
                      child: Text(
                        'Update Plant Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Plant Name
                    const Text(
                      'Plant Name',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _name,
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: lightGreen,
                        hintText: 'Enter plant name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon:
                            const Icon(Icons.local_florist, color: darkGreen),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Plant Type Dropdown
                    const Text(
                      'Plant Type',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      initialValue: _plantType,
                      dropdownColor: lightGreen,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: ['Tomato', 'Potato', 'Pepper', 'Cucumber']
                          .map(
                              (p) => DropdownMenuItem(value: p, child: Text(p)))
                          .toList(),
                      onChanged: (v) => setState(() => _plantType = v),
                    ),
                    const SizedBox(height: 16),

                    // Image Picker
                    const Text(
                      'Plant Image',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    Stack(
                      children: [
                        TextField(
                          controller: _image,
                          readOnly: true,
                          style: const TextStyle(color: Colors.black87),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: lightGreen,
                            hintText: 'Select plant image',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon:
                                const Icon(Icons.image, color: darkGreen),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 6,
                          bottom: 6,
                          child: InkWell(
                            onTap: _pickImage,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFDFE9B3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.photo_library,
                                  color: darkGreen),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_pickedImage != null) ...[
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _pickedImage!,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),

                    // Location
                    const Text(
                      'Location',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _location,
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: lightGreen,
                        hintText: 'Enter plant location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.place, color: darkGreen),
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: const Icon(Icons.delete, color: Colors.white),
                            label: const Text(
                              'Delete',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: _delete,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkGreen,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: const Icon(Icons.save, color: Colors.white),
                            label: const Text(
                              'Save',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: _save,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
