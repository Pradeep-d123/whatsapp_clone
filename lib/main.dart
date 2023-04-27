import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/login.dart';
import 'package:whatsapp/models/animated/twinAnimated.dart';
import 'package:whatsapp/models/animation.dart';
import 'package:whatsapp/calls.dart';
import 'package:whatsapp/chats.dart';
import 'package:whatsapp/dummescreen.dart';
import 'package:whatsapp/group.dart';
import 'package:whatsapp/newmodel.dart';
import 'package:whatsapp/status.dart';
import 'package:whatsapp/statusmodel.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen());
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  ChartModel? chartModel;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   color: Colors.green,
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //     Row(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(left: 20),
      //           child: Text(
      //             "WhatsApp",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 25,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         SizedBox(width: 120),
      //         IconButton(
      //           onPressed: () {},
      //           icon: Icon(
      //             Icons.camera_alt_outlined,
      //             size: 25,
      //             color: Colors.white,
      //           ),
      //         ),
      //         IconButton(
      //           onPressed: () {},
      //           icon: Icon(
      //             Icons.search_outlined,
      //             size: 25,
      //             color: Colors.white,
      //           ),
      //         ),
      //         IconButton(
      //           onPressed: () {},
      //           icon: Icon(
      //             Icons.more_vert,
      //             size: 25,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ],
      //     ),
      //     SizedBox(height: 18),
      //     Row(children: [
      //       InkWell(
      //           onTap: () {
      //             cindex = 0;
      //           },
      //           child: Icon(Icons.people_sharp, color: Colors.white, size: 28)),
      //       SizedBox(width: 30),
      //       InkWell(
      //         onTap: () {
      //           cindex = 1;
      //         },
      //         child: Text("Chats",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w700)),
      //       ),
      //       SizedBox(width: 7),
      //       Container(
      //         height: 20,
      //         width: 20,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20), color: Colors.white),
      //         child: Center(
      //           child: Text("3", style: TextStyle(fontWeight: FontWeight.w800)),
      //         ),
      //       ),
      //       SizedBox(width: 80),
      //       InkWell(
      //         onTap: () {
      //           cindex = 2;
      //         },
      //         child: Text("Status",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w700)),
      //       ),
      //       SizedBox(width: 80),
      //       InkWell(
      //         onTap: () {
      //           cindex = 3;
      //         },
      //         child: Text("Calls",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w700)),
      //       ),
      //     ]),
      //     Container(
      //       height: 5,
      //       width: 50,
      //       decoration: BoxDecoration(color: Colors.white),
      //     ),
      //     Expanded(
      //         child: Container(
      //       color: Colors.red,
      //     ))
      //   ]),
      // ),
      appBar: AppBar(
        title: Text("WhatsApp"),
        backgroundColor: Colors.green.shade300,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (Context) {
                      return Container(
                          child: Column(
                        children: [Text("data"), Text("data")],
                      ));
                    });
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime.now());
              },
              icon: Icon(Icons.more_vert))
        ],
        bottom: TabBar(
            indicatorColor: Colors.white,
            controller: tabController,
            tabs: [
              Tab(icon: Icon(Icons.people)),
              Tab(
                text: "Chats",
              ),
              Tab(
                text: "Status",
              ),
              Tab(
                text: "Calls",
              )
            ]),
      ),
      body: TabBarView(
          controller: tabController,
          children: [Group(), Chats(), StatusScreen(), Calls()]),
    );
  }
}
