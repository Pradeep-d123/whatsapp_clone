import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/newmodel.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  Future<ChartModel> datacall() async {
    final http.Response response =
        await http.post(Uri.parse("http://192.168.29.26:3000/charts"));
    final json = jsonDecode(response.body);
    ChartModel userdata = ChartModel.fromjson(json);
    return userdata;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: datacall(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("DAta Eroor"));
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.charts?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      leading: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actionsAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  contentPadding: EdgeInsets.zero,
                                  actions: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.message)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.call_sharp)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.video_call))
                                  ],
                                  content: Image.network(
                                      snapshot.data?.charts?[index].image ?? "",
                                      fit: BoxFit.cover),
                                );
                              });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      snapshot.data?.charts?[index].image ??
                                          ""))),
                        ),
                      ),
                      title: Text(snapshot.data?.charts?[index].name ?? "",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text(
                        snapshot.data?.charts?[index].lastName ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(snapshot.data?.charts?[index].time ?? ""),
                          SizedBox(height: 8),
                          if ((snapshot.data?.charts?[index].count ?? 0) > 0)
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.green),
                              child: Center(
                                  child: Text(
                                snapshot.data?.charts?[index].count
                                        .toString() ??
                                    "",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
