import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_contact/model.dart';
import 'package:simple_contact/screen/contact_relation.dart';

import 'fetch_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool clickToseeContact = false;
  List<Contact> x = [];
  List<Contact> y = [];
  int len1;
  int len2;
  File file;

  @override
  void initState() {
    super.initState();
    initfn();
  }

  initfn() async {
    file = await FetchData().addInitial();
    getData();
  }

  getData() {
    x = [];
    y = [];
    setState(() {
      x.addAll(FetchData().undefined(file));
    });
    setState(() {
      y.addAll(FetchData().related(file));
    });
    if (y.length != 0) print("y ${y[0].relation}");
    print("y ${x[0].relation}");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: SizedBox(
        height: height * .6,
        width: width,
        child: Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: width,
                height: 80,
                child: Card(
                  margin: EdgeInsets.all(0),
                  color: Colors.lightBlue,
                  child: Center(
                      child: Text("Select a platform to import contact")),
                ),
              ),
              clickToseeContact == false
                  ? Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  clickToseeContact = true;
                                  new Future.delayed(new Duration(seconds: 1),
                                      () {
                                    // Navigator.pop(context); //pop dialog
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ContactRelation()),
                                    );
                                    setState(() {
                                      clickToseeContact = false;
                                    });
                                  });
                                });
                                // Add your onPressed code here!
                              },
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  // margin: EdgeInsets.all(0),
                                  child: Center(
                                    child: SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Card(
                                        // margin: EdgeInsets.only(right: 3),
                                        color: Colors.black,
                                        child: Center(
                                          child: Text(
                                            "f",
                                            style: new TextStyle(
                                                fontSize: 40.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  clickToseeContact = true;
                                  new Future.delayed(new Duration(seconds: 1),
                                      () {
                                    // Navigator.pop(context); //pop dialog
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ContactRelation()),
                                    );
                                    setState(() {
                                      clickToseeContact = false;
                                    });
                                  });
                                });
                                // Add your onPressed code here!
                              },
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  // margin: EdgeInsets.all(0),
                                  child: Center(
                                    child: Text(
                                      "G",
                                      style: new TextStyle(
                                          fontSize: 40.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  clickToseeContact = true;
                                  new Future.delayed(new Duration(seconds: 1),
                                      () {
                                    // Navigator.pop(context); //pop dialog
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ContactRelation()),
                                    );
                                    setState(() {
                                      clickToseeContact = false;
                                    });
                                  });
                                });
                                // Add your onPressed code here!
                              },
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Icon(
                                    Icons.contacts,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: new Center(
                        child: new SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: new CircularProgressIndicator(
                            value: null,
                            strokeWidth: 7.0,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    ));
  }
}
