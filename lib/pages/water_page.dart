import 'package:flutter/material.dart';
import 'package:sprinkle_and_sprout/widgets/custom_list_tile.dart';

class WaterScreen extends StatelessWidget {
  const WaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Daily Water Consumption',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:20.0,right:20,top:40),
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(height: 30),
            itemBuilder: (context, index) {
              return CustomListTile(
                leading: const Icon(Icons.water_drop, size: 30),
                title: Text(
                  'Water Item ${index + 1}',
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
