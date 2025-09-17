import 'package:flutter/material.dart';

class PreviousScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الصفحة السابقة',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('هذه صفحة للرجوع إلى شاشة سابقة. اختر وجهتك:',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
              SizedBox(height: 18),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: Text('العودة إلى صفحة تسجيل الدخول'),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/manager'),
                child: Text('الذهاب إلى صفحة المدير'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
