import 'package:flutter/material.dart';

class AddManagerScreen extends StatefulWidget {
  @override
  _AddManagerScreenState createState() => _AddManagerScreenState();
}

class _AddManagerScreenState extends State<AddManagerScreen> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? _assignedGreenhouse;

  void _add() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF7B8C5F);
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
                Text('Add a New Manager',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ]),
              SizedBox(height: 24),
              TextField(
                  controller: _fullName,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFE9F5C6),
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none))),
              SizedBox(height: 12),
              TextField(
                  controller: _userName,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFE9F5C6),
                      hintText: 'User Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none))),
              SizedBox(height: 12),
              TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFE9F5C6),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none))),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _assignedGreenhouse,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFE9F5C6),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
                hint: Text('Assigning Greenhouses'),
                items: ['Greenhouse A', 'Greenhouse B', 'Greenhouse C']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (v) => setState(() => _assignedGreenhouse = v),
              ),
              SizedBox(height: 20),
              Row(children: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Cancel')),
                SizedBox(width: 12),
                ElevatedButton(
                    onPressed: _add,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2C3A1A)),
                    child: Text('Add'))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
