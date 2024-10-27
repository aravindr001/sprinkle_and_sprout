import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/controllers/auth_controller.dart';
import 'package:sprinkle_and_sprout/widgets/chart.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
          child: Column(
            children: [
              const DashboardTxt(),
              const SizedBox(height: 40),
              UserDetails(name: authController.userName.value),
              const SizedBox(height: 40),
              Container(
                height: 140,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color.fromARGB(255, 230, 228, 228), width: 2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "December",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconColumn(
                            iconPath: "assets/images/Droplet.png", label: "13"),
                        VerticalDivider(
                          width: 2,
                          thickness: 1,
                          color: Colors.black,
                        ),
                        IconColumn(
                            iconPath: "assets/images/flash 1.png", label: "13"),
                        VerticalDivider(
                          width: 2,
                          thickness: 1,
                          color: Colors.black,
                        ),
                        IconColumn(
                            iconPath: "assets/images/gas-cylinder 1.png",
                            label: "13"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),

              // MonthlyBarChart()
              BarChartWidget(
                monthlyData: [
                  5,
                  8,
                  3,
                  7,
                  10,
                  6,
                  12,
                  9,
                  5,
                  8,
                  7,
                  10
                ], // Sample data
              ),
            ],
          ),


        ),
      ),
    );
  }
}

class DashboardTxt extends StatelessWidget {
  const DashboardTxt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Dashboard",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () => Get.find<AuthController>().signOut(),
          child: const Text('Log out'),
        ),
      ],
    );
  }
}

class UserDetails extends StatelessWidget {
  final String name;

  const UserDetails({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/usr.png",
          width: 80,
          height: 80,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Kerala, India",
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}

class IconColumn extends StatelessWidget {
  final String iconPath;
  final String label;

  const IconColumn({
    Key? key,
    required this.iconPath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(iconPath, width: 40, height: 40),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
