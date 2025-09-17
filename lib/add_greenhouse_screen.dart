import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddGreenhouseScreen extends StatefulWidget {
  @override
  _AddGreenhouseScreenState createState() => _AddGreenhouseScreenState();
}

class _AddGreenhouseScreenState extends State<AddGreenhouseScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _image = TextEditingController();
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

  final TextEditingController _location = TextEditingController();

  void _save() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF6B8A4A);
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('Add Greenhouse',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
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
                        borderSide: BorderSide.none)),
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
                            borderSide: BorderSide.none)),
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
                        child:
                            Icon(Icons.photo_library, color: Color(0xFF2C3A1A)),
                      ),
                    ),
                  ),
                ],
              ),
              if (_pickedImage != null) ...[
                SizedBox(height: 8),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(_pickedImage!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover)),
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
                        borderSide: BorderSide.none)),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2C3A1A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
