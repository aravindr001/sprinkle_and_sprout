import "package:flutter/material.dart";

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;

  const CustomListTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(leading: leading,title: title,trailing: trailing,),
    );

  }
}
