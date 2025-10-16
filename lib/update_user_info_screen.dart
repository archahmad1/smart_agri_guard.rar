import 'package:flutter/material.dart';

class UpdateUserInfoScreen extends StatefulWidget {
  @override
  _UpdateUserInfoScreenState createState() => _UpdateUserInfoScreenState();
}

class _UpdateUserInfoScreenState extends State<UpdateUserInfoScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Omar Abdallah Mohammad');
  final TextEditingController _usernameController =
      TextEditingController(text: 'omar.abdallah');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF7B8C5F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B8C5F),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Update Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo.png', height: 40),
                        const SizedBox(width: 10),
                        const Text(
                          'Smart Agri-Guard',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Full Name
                    const Text(
                      'Full Name',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _nameController,
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFDDE8B8),
                        hintText: 'Enter your name',
                        hintStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon:
                            const Icon(Icons.person, color: Color(0xFF50623A)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Username
                    const Text(
                      'Username',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _usernameController,
                      enabled: false,
                      style: const TextStyle(color: Colors.white70),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF6E7F55),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.account_circle,
                            color: Colors.white70),
                      ),
                    ),

                    const Spacer(),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE9F5C6),
                          foregroundColor: const Color(0xFF50623A),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.save),
                        label: const Text(
                          'SAVE CHANGES',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        onPressed: () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: const Color(0xFFE9F5C6),
                              title: const Text(
                                'Confirm Update',
                                style: TextStyle(color: Color(0xFF50623A)),
                              ),
                              content: const Text(
                                'Are you sure you want to save these changes?',
                                style: TextStyle(color: Color(0xFF50623A)),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(false),
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Color(0xFF50623A)),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(true),
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Color(0xFF50623A),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          );

                          if (confirmed == true) {
                            // TODO: Call API to update user info
                            Navigator.pop(context);
                          }
                        },
                      ),
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
