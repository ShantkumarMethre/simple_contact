import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_contact/screen/contact_relation.dart';

import '../fetch_data.dart';
import '../model.dart';

enum Status { active, inactive }

class RelationAdding extends StatefulWidget {
  RelationAdding({Key key, this.data, this.onPress}) : super(key: key);
  Function onPress;
  Contact data;
  @override
  RelationAddingState createState() => RelationAddingState();
}

class RelationAddingState extends State<RelationAdding> {
  List<String> litems;

  List<Status> _statuses;

  @override
  void initState() {
    super.initState();
    initfn();
  }

  initfn() {
    litems = ["Father", "Mother", "Sister", "Brother", "friend"];
    _statuses = litems.map((a) => Status.inactive).toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    print("int the render slider ");
    print(widget.data);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Scaffold(
        appBar: AppBar(
          title: Text("${widget.data.firstname} ${widget.data.lastname}"),
        ),
        // width: MediaQuery.of(context).size.width * 0.9, //20.0,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 130,
              width: width * .9,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Text(
                      "Who is '${widget.data.firstname}' to you",
                      style: new TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "age ${widget.data.age}",
                            style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                Text(
                                  "${widget.data.location}",
                                  style: new TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "select ONE of them to help us identify the correct family member",
                style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
            ),
            Container(
                height: height / 1.5,
                child: new ListView.builder(
                    itemCount: litems.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _statuses[index] = Status.active;
                          });

                          widget.onPress(widget.data.phone, litems[index]);

                          new Future.delayed(new Duration(milliseconds: 500),
                              () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        },
                        child: SizedBox(
                          height: 110,
                          width: width,
                          child: Card(
                            color: _statuses[index] == Status.inactive
                                ? Colors.white
                                : Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6),
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6)),
                            ),
                            child: Center(
                                child: Text(
                              "${litems[index]}",
                              style: new TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                              ),
                            )),
                            // color: Colors.blue,
                          ),
                        ),
                      );
                    })),
          ],
        ));
  }
}
