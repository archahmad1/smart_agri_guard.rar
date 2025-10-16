import 'package:flutter/material.dart';
import 'add_plant_type_screen.dart';
import 'update_plant_type_screen.dart';

class PlantTypeListScreen extends StatefulWidget {
  const PlantTypeListScreen({super.key});

  @override
  State<PlantTypeListScreen> createState() => _PlantTypeListScreenState();
}

class _PlantTypeListScreenState extends State<PlantTypeListScreen> {
  List<Map<String, String>> plantTypes = [
    {'name': 'Tomato', 'description': 'Common vegetable crop'},
    {'name': 'Cactus', 'description': 'Requires minimal water'},
    {'name': 'Basil', 'description': 'Herb used in cooking'},
    {'name': 'Rose', 'description': 'Popular flowering plant'},
    {'name': 'Lavender', 'description': 'Fragrant herb'},
    {'name': 'Sunflower', 'description': 'Large yellow flowers'},
    {'name': 'Mint', 'description': 'Refreshing herb'},
    {'name': 'Orchid', 'description': 'Exotic flowering plant'},
    {'name': 'Lettuce', 'description': 'Leafy green vegetable'},
    {'name': 'Aloe Vera', 'description': 'Medicinal succulent plant'},
    {'name': 'Pepper', 'description': 'Spicy vegetable crop'},
    {'name': 'Daisy', 'description': 'Simple and cheerful flower'},
    {'name': 'Thyme', 'description': 'Culinary herb'},
    {'name': 'Fern', 'description': 'Shade-loving plant'},
    {'name': 'Chili', 'description': 'Hot and spicy vegetable'},
    {'name': 'Tulip', 'description': 'Spring-blooming flower'},
    {'name': 'Cilantro', 'description': 'Herb used in various cuisines'},
    {'name': 'Ivy', 'description': 'Climbing or trailing plant'},
    {'name': 'Cabbage', 'description': 'Leafy vegetable crop'},
    {'name': 'Jasmine', 'description': 'Fragrant flowering plant'},
  ];

  void _deletePlantType(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFFEFF6C9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          'Confirm Deletion',
          style: TextStyle(
            color: Color(0xFF50623A),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Are you sure you want to delete this plant type?',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF50623A)),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              setState(() => plantTypes.removeAt(index));
              Navigator.of(ctx).pop();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7B8C5F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B8C5F),
        elevation: 0,
        title: const Text(
          'Plant Type Management',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE9F5C6),
        child: const Icon(Icons.add, color: Color(0xFF50623A)),
        onPressed: () async {
          final newType = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddPlantTypeScreen()),
          );
          if (newType != null) {
            setState(() => plantTypes.add(newType));
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: plantTypes.length,
          itemBuilder: (context, index) {
            final plant = plantTypes[index];
            return Card(
              color: const Color(0xFFE9F5C6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading:
                    const Icon(Icons.local_florist, color: Color(0xFF50623A)),
                title: Text(
                  plant['name']!,
                  style: const TextStyle(
                    color: Color(0xFF2C3A1A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  plant['description']!.isEmpty
                      ? 'No description'
                      : plant['description']!,
                  style: const TextStyle(color: Color(0xFF2C3A1A)),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Color(0xFF50623A)),
                      onPressed: () async {
                        final updatedType = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UpdatePlantTypeScreen(
                              initialName: plant['name']!,
                              initialDescription: plant['description']!,
                            ),
                          ),
                        );
                        if (updatedType != null) {
                          setState(() => plantTypes[index] = updatedType);
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () => _deletePlantType(index),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
