import "package:flutter/material.dart";

class CustomListTile extends StatelessWidget {
  final String leading;
  final String title;
  final String trailing;

  const CustomListTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(leading),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        trailing: Text(trailing,style: const TextStyle(fontSize: 18),),
      ),
    );
  }
}
