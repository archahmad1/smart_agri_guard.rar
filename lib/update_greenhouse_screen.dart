import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateGreenhouseScreen extends StatefulWidget {
  final String name;
  UpdateGreenhouseScreen({required this.name});

  @override
  _UpdateGreenhouseScreenState createState() => _UpdateGreenhouseScreenState();
}

class _UpdateGreenhouseScreenState extends State<UpdateGreenhouseScreen> {
  late TextEditingController _name;
  final TextEditingController _image = TextEditingController(text: 'image.png');
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

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

  final TextEditingController _location = TextEditingController(text: 'Amman');

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.name);
  }

  void _save() {
    Navigator.of(context).pop();
  }

  void _delete() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF6B8A4A);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Update greenhouse',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    TextField(
                      controller: _name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFE9F5C6),
                        hintText: 'Greenhouse Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Stack(
                      children: [
                        TextField(
                          controller: _image,
                          readOnly: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFE9F5C6),
                            hintText: 'Greenhouse Image',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 6,
                          bottom: 6,
                          child: InkWell(
                            onTap: _pickImage,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xFFDFE9B3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(Icons.photo_library,
                                  color: Color(0xFF2C3A1A)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_pickedImage != null) ...[
                      SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _pickedImage!,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                    SizedBox(height: 12),
                    TextField(
                      controller: _location,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFE9F5C6),
                        hintText: 'Location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _delete,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Delete Greenhouse'),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _save,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF2C3A1A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text('Save changes'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
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
