import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pmi_calculator/page2.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isval = true;
  var age;

  int val = 1;
  var mw = 0;
  var ma = 0;
  double weight = 40;
  double height = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isval = true;
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 300,
                        color: isval ? Colors.pinkAccent : Colors.white,
                        child: Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                "images/female.png",
                                // width: 150,
                                height: 150,
                              ),
                              Text("female")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isval = false;
                        });
                      },
                      child: Expanded(
                        child: Container(
                          width: 200,
                          height: 300,
                          color: isval ? Colors.white : Colors.blue,
                          child: Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/male.png",
                                  // width: 150,
                                  height: 100,
                                ),
                                Text("male")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      "$val",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Slider(
                        min: 1,
                        max: 200,
                        value: val.toDouble(),
                        onChanged: (double newval) {
                          setState(() {
                            val = newval.round();
                          });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Text(
                            "$mw",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Center(
                            child: Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      mw++;
                                    });
                                  },
                                  key: Key("1"),
                                  child: Icon(Icons.add),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      mw--;
                                    });
                                  },
                                  key: Key("2"),
                                  child: Icon(Icons.remove),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Text(
                            "$ma",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Center(
                            child: Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      ma++;
                                    });
                                  },
                                  key: Key("1"),
                                  child: Icon(Icons.add),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      ma--;
                                    });
                                  },
                                  key: Key("2"),
                                  child: Icon(Icons.remove),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    double res = weight / pow(height / 100, 2);
                  print(res);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultScreen(
                    ismale: isval,
                    age: age,
                    result: result,

                  )));



                  },

                  child: (Text(
                    "Calculator",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
