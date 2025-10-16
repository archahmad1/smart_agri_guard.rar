import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF7B8C5F),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: isWide ? size.width * 0.15 : 16.0,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Header Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE9F5C6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios,
                          size: 18, color: Color(0xFF50623A)),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 30,
                        errorBuilder: (c, e, s) => const Icon(Icons.agriculture, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
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
                  const SizedBox(width: 36), // balance
                ],
              ),

              const SizedBox(height: 24),

              // ✅ Profile Card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6C9),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xFFDFE9B3),
                      radius: 24,
                      child: Icon(Icons.person, color: Color(0xFF50623A), size: 28),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Omar Abdallah Mohammad',
                        style: TextStyle(
                          color: Color(0xFF50623A),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Color(0xFF50623A)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/update_user_info');
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ✅ Settings Section
              _settingRow(
                context,
                Icons.notifications_active_outlined,
                'Notifications',
                _notifications,
                (v) => setState(() => _notifications = v),
              ),
              const Divider(color: Colors.white38),

              _linkRow(context, Icons.email_outlined, 'Contact Us'),
              const Divider(color: Colors.white38),
              _linkRow(context, Icons.language, 'Language'),
              const Divider(color: Colors.white38),
              _linkRow(context, Icons.lock_outline, 'Change Password'),
              const Divider(color: Colors.white38),
              _linkRow(context, Icons.help_outline, 'Help'),
              const Divider(color: Colors.white38),
              _linkRow(context, Icons.logout, 'Logout'),

              const SizedBox(height: 30), // bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingRow(BuildContext context, IconData icon, String label,
      bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: const Color(0xFFEFF6C9),
          ),
        ],
      ),
    );
  }

  Widget _linkRow(BuildContext context, IconData icon, String label) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white70),
      title: Text(label, style: const TextStyle(color: Colors.white70)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white54),
      onTap: () async {
        if (label == 'Logout') {
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor: const Color(0xFFE9F5C6),
              title: const Text(
                'Confirm Logout',
                style: TextStyle(color: Color(0xFF50623A)),
              ),
              content: const Text(
                'Are you sure you want to log out?',
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
                    'Logout',
                    style: TextStyle(
                        color: Color(0xFF50623A),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );

          if (confirmed == true) {
            Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false);
          }
        } else if (label == 'Change Password') {
          Navigator.pushNamed(context, '/change_password');
        } else if (label == 'Contact Us') {
          // TODO: Navigate to Contact Us page
        }
      },
    );
  }
}
