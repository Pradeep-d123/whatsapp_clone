import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TwinAnimated extends StatefulWidget {
  const TwinAnimated({super.key});

  @override
  State<TwinAnimated> createState() => _TwinAnimatedState();
}

class _TwinAnimatedState extends State<TwinAnimated>
    with SingleTickerProviderStateMixin {
  double top = 100;

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        bottom: TabBar(
          controller: tabController,
          tabs: [Text("data"), Text("data"), Text("data"), Text("data")],
        ),
      ),
    );
  }
}
