import 'package:flutter/material.dart';

class UpdateManagerScreen extends StatefulWidget {
  final String name;
  const UpdateManagerScreen({super.key, required this.name});

  @override
  State<UpdateManagerScreen> createState() => _UpdateManagerScreenState();
}

class _UpdateManagerScreenState extends State<UpdateManagerScreen> {
  late TextEditingController _fullName;
  final TextEditingController _userName =
      TextEditingController(text: 'ahmad-amer-31');
  final TextEditingController _password =
      TextEditingController(text: '********');
  String? _assignedGreenhouse = 'Greenhouse A';

  @override
  void initState() {
    super.initState();
    _fullName = TextEditingController(text: widget.name);
  }

  void _save() {
    Navigator.of(context).pop();
  }

  void _delete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFFEFF6C9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          'Confirm Delete',
          style:
              TextStyle(color: Color(0xFF50623A), fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Are you sure you want to delete this manager?',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('Cancel',
                  style: TextStyle(
                      color: Color(0xFF50623A), fontWeight: FontWeight.bold))),
          ElevatedButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child:
                  const Text('Delete', style: TextStyle(color: Colors.white)))
        ],
      ),
    );

    if (confirmed == true) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bg = const Color(0xFF7B8C5F);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
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
                    'Update Manager',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 24),

              // Full Name
              TextField(
                controller: _fullName,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE9F5C6),
                  hintText: 'Full Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 12),

              // Username
              TextField(
                controller: _userName,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE9F5C6),
                  hintText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 12),

              // Password
              TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE9F5C6),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 12),

              // Assigned Greenhouse Dropdown
              DropdownButtonFormField<String>(
                value: _assignedGreenhouse,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFE9F5C6),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
                items: ['Greenhouse A', 'Greenhouse B', 'Greenhouse C']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (v) => setState(() => _assignedGreenhouse = v),
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _delete,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text('Delete Manager'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C3A1A),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
