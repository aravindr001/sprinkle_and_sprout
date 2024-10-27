import 'package:flutter/material.dart';
import 'package:sprinkle_and_sprout/widgets/custom_button.dart';

class AddDetails extends StatelessWidget {
  const AddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left:20.0,right:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [
            const Text("Add Monthly Consumption",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            GreenButton(width: 300,height: 80,text: "WATER", onPressed: (){}),
            GreenButton(
                width: 300, height: 80, text: "ELECTICITY", onPressed: (){}),
            GreenButton(
                width: 300, height: 80, text: "COOKING GAS", onPressed: (){})
          ],
        ),
      ),
    );
  }
}