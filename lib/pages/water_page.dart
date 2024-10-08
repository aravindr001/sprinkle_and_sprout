import 'package:flutter/material.dart';
import 'package:sprinkle_and_sprout/widgets/custom_list_tile.dart';

class WaterScreen extends StatelessWidget {
  const WaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> waterConsumptionDict = [
      {
        "activity":"Chores",
        "image": "assets/activities_images/washing.png",
        "amount": "5L"
      },
      {
        "activity": "Personal Hygiene",
        "image": "assets/activities_images/personal_use.png",
        "amount": "25L"

      },
      {
        "activity": "Gardening",
        "image": "assets/activities_images/gardening.png",
        "amount": "10L"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
             mainAxisSize: MainAxisSize.min, // Minimizes the size of the column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            const Text(
              'Daily Water Consumption',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
         toolbarHeight: 80, // Adjust the height of the AppBar
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:20.0,right:20,top:120),
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(height: 30),
            itemBuilder: (context, index) {
              final activityData = waterConsumptionDict[index];
              return CustomListTile(
                leading: activityData['image'],
                title: activityData['activity'],
                trailing: activityData['amount'],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'waterFAB',
        onPressed: () => _showAddWaterConsumptionDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddWaterConsumptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Water Consumption'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount (in liters)',
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
