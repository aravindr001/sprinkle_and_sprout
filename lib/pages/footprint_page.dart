import 'package:flutter/material.dart';
import 'package:sprinkle_and_sprout/widgets/custom_list_tile.dart';

class FootPrint extends StatelessWidget {
  const FootPrint({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> footprint = [
      {
        "activity": "Cooking",
        "image": "assets/footprint_images/burning.png",
        "time": "15 minutes"
      },
      {
        "activity": "Bus",
        "image": "assets/footprint_images/Bus.png",
        "time": "30 mins"
      },
      {
        "activity": "Waste Burning",
        "image": "assets/footprint_images/burning.png",
        "time": "1.5 hour" 
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Daily Carbon Footprint',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 120),
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(height: 30),
            itemBuilder: (context, index) {
              final activityData = footprint[index];
              return CustomListTile(
                leading: activityData['image'],
                title: activityData['activity'],
                trailing: activityData['time'],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'footprintFAB',  
        onPressed: () => _showAddFootprintnDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddFootprintnDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add your Footprint'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount (in liters)',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                // TODO: Add logic to save the water consumption data
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
