import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.green.shade500,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
            child: Text("Start your Community",
                style: TextStyle(fontWeight: FontWeight.w600))),
      ),
    );
  }
}
