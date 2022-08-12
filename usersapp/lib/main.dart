import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map data;
  late List usersData;

  getUsers() async {
    http.Response response =
        await http.get(Uri.parse('http://192.168.1.15:4000/api/users'));
    data = json.decode(response.body);
    setState(() {
      usersData = data['userList'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuarios'),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(
        itemCount: usersData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "$index",
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${usersData[index]["firstName"]} ${usersData[index]["lastName"]}",
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${usersData[index]["phoneNumber"]}"),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
