import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/dummymodel.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  Future<Data> datacall() async {
    final http.Response response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    final json = jsonDecode(response.body);
    return Data.fromjson(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: datacall(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Server Issue"));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      snapshot.data?.data?[index].image ??
                                          ""))),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text(snapshot.data?.data?[index].firstname ?? ""),
                          Text(snapshot.data?.data?[index].id.toString() ?? ""),
                          Text(snapshot.data?.data?[index].emailId ?? "")
                        ]),
                      ),
                    );
                  });
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
