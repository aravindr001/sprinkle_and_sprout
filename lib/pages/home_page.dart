import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sprinkle_and_sprout/controllers/pi_chart_controller.dart';

PieController pieController = Get.put(PieController());

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Map<String, double> dataMap = {
    "Chores": 5,
    "Personal Hygine": 3,
    "Gardening": 2,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0, left: 20, right: 20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: DashboardTxt(),
                ),
                const SizedBox(
                  height: 40,
                ),
                const UserDetails(),
                const SizedBox(
                  height: 40,
                ),
                const WaterAndCarbonMonitor(),
                const SizedBox(
                  height: 70,
                ),
                PieChart(dataMap: dataMap)
                // PieChart(dataMap: pieController.dataMap1.map((key, value) => MapEntry(key.toString(), value.toDouble())))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WaterAndCarbonMonitor extends StatelessWidget {
  const WaterAndCarbonMonitor({
    super.key,
  });

  final double height = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Monitoring(
              text1: '100L',
              text2: 'water used',
              function: () {
                pieController.index.value = true;
                print(pieController.index.value);
              },
            ),
            Container(
              width: 1,
              height: height - 20,
              color: Colors.black,
            ),
            Monitoring(
              text1: '87KG',
              text2: 'carbon footprint',
              function: () {
                pieController.index.value = false;
                print(pieController.index.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Monitoring extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback function;

  const Monitoring(
      {super.key,
      required this.text1,
      required this.text2,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(text1,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w900)),
              Text(text2,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 131, 130, 127),
                      fontSize: 18,
                      fontWeight: FontWeight.w900))
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardTxt extends StatelessWidget {
  const DashboardTxt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Dashboard",
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: const Text(
          "Naman Jha",
          style: TextStyle(fontSize: 45, color: Colors.white),
        ),
        subtitle: const Text(
          "kerala, India",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        leading: Image.asset(
          "assets/images/usr.png",
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}
