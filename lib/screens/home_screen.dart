import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lotto_lottery/components/circle_container.dart';
import 'package:lotto_lottery/networking/get_number.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int round = 924;
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 30.0,
            ),
            child: Text("$round회차 당첨 결과",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: FutureBuilder<List<String>>(
              future: getNumber(http.Client(), round),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleContainer(Colors.green, snapshot.data[0]),
                          CircleContainer(Colors.green, snapshot.data[1]),
                          CircleContainer(Colors.green, snapshot.data[2]),
                          CircleContainer(Colors.green, snapshot.data[3]),
                          CircleContainer(Colors.green, snapshot.data[4]),
                          CircleContainer(Colors.blue, snapshot.data[5]),
                        ],
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text(
                  "이전 회차",
                ),
                onPressed: () {
                  setState(() {
                    round -= 1;
                  });
                },
              ),
              RaisedButton(
                child: Text(
                  "다음 회차",
                ),
                onPressed: () {
                  setState(() {
                    round += 1;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
