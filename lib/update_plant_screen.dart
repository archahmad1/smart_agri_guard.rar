import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePlantScreen extends StatefulWidget {
  final String name;
  final String greenhouseName;
  UpdatePlantScreen({required this.name, this.greenhouseName = 'Greenhouse A'});
  @override
  _UpdatePlantScreenState createState() => _UpdatePlantScreenState();
}

class _UpdatePlantScreenState extends State<UpdatePlantScreen> {
  late TextEditingController _name;
  String? _plantType = 'Tomato';
  final TextEditingController _image =
      TextEditingController(text: 'tomato.png');
  final TextEditingController _location =
      TextEditingController(text: 'right side of the greenhouse');
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
    if (file != null)
      setState(() {
        _pickedImage = File(file.path);
        _image.text = file.name;
      });
  }

  void _save() => Navigator.of(context).pop();
  void _delete() => Navigator.of(context).pop();

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
              Row(children: [
                GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white24, shape: BoxShape.circle),
                        child: Icon(Icons.arrow_back, color: Colors.white))),
                SizedBox(width: 12),
                Text(widget.greenhouseName,
                    style: TextStyle(color: Colors.white70))
              ]),
              SizedBox(height: 12),
              TextField(
                  controller: _name,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFE9F5C6),
                      hintText: 'Plant Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none))),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                  value: _plantType,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFE9F5C6),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none)),
                  items: ['Tomato', 'Potato', 'Pepper']
                      .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                      .toList(),
                  onChanged: (v) => setState(() => _plantType = v)),
              SizedBox(height: 12),
              Stack(
                children: [
                  TextField(
                      controller: _image,
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFE9F5C6),
                          hintText: 'Plant Image',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none))),
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
                              child: Icon(Icons.photo_library,
                                  color: Color(0xFF2C3A1A)))))
                ],
              ),
              if (_pickedImage != null) ...[
                SizedBox(height: 8),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(_pickedImage!,
                        height: 120, width: double.infinity, fit: BoxFit.cover))
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
                          borderSide: BorderSide.none))),
              SizedBox(height: 20),
              Row(children: [
                ElevatedButton(
                    onPressed: _delete,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('Delete Plant')),
                SizedBox(width: 12),
                ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2C3A1A)),
                    child: Text('Save changes'))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
