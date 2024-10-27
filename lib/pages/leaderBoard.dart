import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    List names = [
      "Alice",
      "Bob",
      "Charlie",
      "David",
      "Emily",
      "Frank",
      "Grace",
      "Henry",
      "Isabella",
      "Jack",
      "Aravind",
      "Joel",
      "Arun"
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Leader board',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: const BorderRadius.only(
                    bottomLeft:
                        Radius.circular(20.0), // Adjust radius as needed
                    bottomRight:
                        Radius.circular(20.0), // Adjust radius as needed
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              names
                  .map((name) => ListTile(title: Text(name)))
                  .toList(), // Build list items with names
            ),
          ),
        ],
      ),
    );
  }
}
