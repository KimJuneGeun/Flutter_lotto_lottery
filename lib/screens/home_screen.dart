import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lotto_lottery/networking/get_number.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로또 번호 조회"),
      ),
      body: Container(
        child: FutureBuilder<List<String>>(
          future: getNumber(http.Client(), 924),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? Text(snapshot.data[0])
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
