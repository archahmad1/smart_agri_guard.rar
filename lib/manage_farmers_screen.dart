import 'package:flutter/material.dart';

class ManageFarmersScreen extends StatefulWidget {
  @override
  _ManageFarmersScreenState createState() => _ManageFarmersScreenState();
}

class _ManageFarmersScreenState extends State<ManageFarmersScreen> {
  List<Map<String, dynamic>> farmers = [
    {
      'fullName': 'Omar Abdullah Mohammed',
      'username': 'omar_231',
      'plants': ['Tomato', 'Pepper']
    },
    {
      'fullName': 'Ali Abdulrahman Mousa',
      'username': 'ali',
      'plants': ['Potato']
    },
    {
      'fullName': 'Issa Ibrahim Abdallah',
      'username': 'issa',
      'plants': ['Strawberry']
    },
  ];

  void _openAdd() async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (_) => AddFarmerScreen()),
    );
    if (result != null) setState(() => farmers.insert(0, result));
  }

  void _openUpdate(int index) async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
          builder: (_) => UpdateFarmerScreen(data: farmers[index])),
    );
    if (result == null) return;
    if (result.containsKey('delete') && result['delete'] == true) {
      setState(() => farmers.removeAt(index));
      return;
    }
    setState(() => farmers[index] = result);
  }

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF7B8C5F);
    final cardBg = Color(0xFFF2EFBF);
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(color: cardBg, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.black87),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                      child: Text('Smart Agri-Guard',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  GestureDetector(
                    onTap: _openAdd,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(color: cardBg, shape: BoxShape.circle),
                      child: Icon(Icons.add, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: farmers.length,
                  itemBuilder: (ctx, i) {
                    final f = farmers[i];
                    return GestureDetector(
                      onTap: () => _openUpdate(i),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            CircleAvatar(
                                child:
                                    Icon(Icons.person, color: Colors.black54),
                                backgroundColor: Colors.white70),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(f['fullName'] ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: 4),
                                  Text(
                                      (f['plants'] as List<dynamic>).join(', '),
                                      style: TextStyle(color: Colors.black54)),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.black54),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddFarmerScreen extends StatefulWidget {
  @override
  _AddFarmerScreenState createState() => _AddFarmerScreenState();
}

class _AddFarmerScreenState extends State<AddFarmerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullName = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  String _assignPlant = 'Tomato';

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF7B8C5F);
    final fieldBg = Color(0xFFEFEFCB);
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(color: fieldBg, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.black87),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('Add a New Farm',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 18),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildField(_fullName, 'Full Name'),
                    SizedBox(height: 12),
                    _buildField(_username, 'User Name'),
                    SizedBox(height: 12),
                    _buildField(_password, 'Password', obscure: true),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: fieldBg,
                          borderRadius: BorderRadius.circular(8)),
                      child: Builder(builder: (ctx) {
                        final plantOptions = ['Tomato', 'Pepper', 'Potato'];
                        return DropdownButtonFormField<String>(
                          initialValue: plantOptions.contains(_assignPlant)
                              ? _assignPlant
                              : null,
                          items: plantOptions
                              .map((p) =>
                                  DropdownMenuItem(value: p, child: Text(p)))
                              .toList(),
                          onChanged: (v) => setState(
                              () => _assignPlant = v ?? plantOptions.first),
                          decoration: InputDecoration(border: InputBorder.none),
                        );
                      }),
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'))),
                        SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            Navigator.pop(context, {
                              'fullName': _fullName.text,
                              'username': _username.text,
                              'plants': [_assignPlant]
                            });
                          },
                          child: Text('Add'),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController ctl, String label,
      {bool obscure = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: Color(0xFFEFEFCB), borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        controller: ctl,
        obscureText: obscure,
        decoration: InputDecoration(border: InputBorder.none, hintText: label),
        validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
      ),
    );
  }
}

class UpdateFarmerScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  UpdateFarmerScreen({required this.data});
  @override
  _UpdateFarmerScreenState createState() => _UpdateFarmerScreenState();
}

class _UpdateFarmerScreenState extends State<UpdateFarmerScreen> {
  late TextEditingController _fullName;
  late TextEditingController _username;
  late TextEditingController _password;
  String _assignPlant = 'Tomato';

  @override
  void initState() {
    super.initState();
    _fullName = TextEditingController(text: widget.data['fullName']);
    _username = TextEditingController(text: widget.data['username']);
    _password = TextEditingController();
    final plants = (widget.data['plants'] as List<dynamic>? ?? []);
    _assignPlant = plants.isNotEmpty ? plants.first as String : 'Tomato';
  }

  @override
  Widget build(BuildContext context) {
    final bg = Color(0xFF7B8C5F);
    final fieldBg = Color(0xFFEFEFCB);
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(color: fieldBg, shape: BoxShape.circle),
                      child: Icon(Icons.arrow_back, color: Colors.black87),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text('Update Farmer',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 18),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    color: fieldBg, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    TextFormField(
                        controller: _fullName,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Full Name')),
                    Divider(),
                    TextFormField(
                        controller: _username,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Username')),
                    Divider(),
                    TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password')),
                    Divider(),
                    Builder(builder: (ctx) {
                      final plantOptions = ['Tomato', 'Pepper', 'Potato'];
                      return DropdownButtonFormField<String>(
                        initialValue: plantOptions.contains(_assignPlant)
                            ? _assignPlant
                            : null,
                        items: plantOptions
                            .map((p) =>
                                DropdownMenuItem(value: p, child: Text(p)))
                            .toList(),
                        onChanged: (v) => setState(
                            () => _assignPlant = v ?? plantOptions.first),
                        decoration: InputDecoration(border: InputBorder.none),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        final ok = await showDialog<bool>(
                          context: context,
                          builder: (c) => AlertDialog(
                            title: Text('Delete Farmer'),
                            content: Text(
                                'Are you sure you want to delete this farmer?'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(c, false),
                                  child: Text('Cancel')),
                              TextButton(
                                  onPressed: () => Navigator.pop(c, true),
                                  child: Text('Delete',
                                      style: TextStyle(color: Colors.red))),
                            ],
                          ),
                        );
                        if (ok == true)
                          Navigator.pop(context, {'delete': true});
                      },
                      child: Text('Delete Farmer',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, {
                          'fullName': _fullName.text,
                          'username': _username.text,
                          'plants': [_assignPlant]
                        });
                      },
                      child: Text('Save changes'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
