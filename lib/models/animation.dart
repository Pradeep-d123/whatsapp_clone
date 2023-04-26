import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  double boarderradius = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => setState(() {
            if (boarderradius == 0) {
              boarderradius = 100;
            } else {
              boarderradius = 0;
            }
          }),
          child: AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: boarderradius == 0 ? 0.4 : 1,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: boarderradius == 0 ? Colors.red : Colors.red,
                  borderRadius: BorderRadius.circular(boarderradius)),
            ),
          ),
        ),
      ),
    );
  }
}
