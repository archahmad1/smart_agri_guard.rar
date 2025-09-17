import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPlantScreen extends StatefulWidget {
  final String greenhouseName;
  AddPlantScreen({this.greenhouseName = 'Greenhouse A'});
  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  final TextEditingController _name = TextEditingController();
  String? _plantType;
  final TextEditingController _image = TextEditingController();
  final TextEditingController _location = TextEditingController();
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? file =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
    if (file != null)
      setState(() {
        _pickedImage = File(file.path);
        _image.text = file.name;
      });
  }

  void _save() => Navigator.of(context).pop();

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
                  Text('Add plant',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ],
              ),
              SizedBox(height: 24),
              Text(widget.greenhouseName,
                  style: TextStyle(color: Colors.white70)),
              SizedBox(height: 12),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFE9F5C6),
                  hintText: 'Plant Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _plantType,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFE9F5C6),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
                hint: Text('Plant Type'),
                items: ['Tomato', 'Potato', 'Pepper']
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: (v) => setState(() => _plantType = v),
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
                      hintText: 'Plant image',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
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
                            borderRadius: BorderRadius.circular(8)),
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
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2C3A1A)),
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
