import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/statusmodel.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  Future<AllStatus> featch() async {
    print("api call");
    final http.Response response =
        await http.post(Uri.parse("http://192.168.29.26:3000/status"));
    print(response);
    final json = jsonDecode(response.body);
    print("Above");
    print(json);

    return AllStatus.fromjson(json);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SingleChildScrollView(
        child: FutureBuilder(
            future: featch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  log(snapshot.error.toString());
                  return Text(snapshot.error.toString());
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      ListTile(
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              border: Border.all(color: Colors.grey)),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data?.mystatus?.name ?? "",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 5),
                            Text(
                              snapshot.data?.mystatus?.time ?? "",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            )
                          ],
                        ),
                        trailing: Icon(Icons.more_horiz,
                            color: Colors.green.shade500),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Recent Update",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 15),
                      ListView.builder(
                          itemCount: snapshot
                                  .data?.recentUpdated?.recentupdated?.length ??
                              0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.green)),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (snapshot
                                                .data
                                                ?.recentUpdated
                                                ?.recentupdated?[index]
                                                .userName
                                                ?.firstname ??
                                            "") +
                                        " " +
                                        (snapshot
                                                .data
                                                ?.recentUpdated
                                                ?.recentupdated?[index]
                                                .userName
                                                ?.lastname ??
                                            ""),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    snapshot.data?.recentUpdated
                                            ?.recentupdated?[index].time ??
                                        "",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            );
                          }),
                      SizedBox(height: 15),
                      Text("Vieved Update",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600)),
                      SizedBox(height: 18),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data?.vivedStatus?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.grey)),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (snapshot.data?.vivedStatus?[index].userName
                                                ?.firstname ??
                                            "") +
                                        " " +
                                        (snapshot.data?.vivedStatus?[index]
                                                .userName?.firstname ??
                                            ""),
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    snapshot.data?.vivedStatus?[index].time ??
                                        "",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            );
                          }),
                    ],
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
