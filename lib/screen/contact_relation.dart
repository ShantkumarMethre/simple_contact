import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_contact/model.dart';
import 'package:simple_contact/screen/slide_drawer.dart';

import '../fetch_data.dart';

class ContactRelation extends StatefulWidget {
  ContactRelation({
    Key key,
  }) : super(key: key);

  @override
  ContactRelationState createState() => ContactRelationState();
}

class ContactRelationState extends State<ContactRelation> {
  int _counter = 0;
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
      y.addAll(FetchData().related(file));
    });
    if (y.length != 0) print("y ${y[0].relation}");
    print("y ${x[0].relation}");
  }

  void _incrementCounter() {
    FetchData().editRelation(file, "120", "mother");
    getData();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("int the render ");
    print(x[0].firstname);
    return Scaffold(
      // drawerDragStartBehavior: DragStartBehavior.start,
      // drawer: SideDrawer(
      //   data: x,
      // ),
      body: Center(
        child: Container(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
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
                              child: Text(
                                  "choose your family members from the list of contact you have ")),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 150,
                                width: width,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SideDrawer(
                                                      data: y,
                                                      buckitName:
                                                          "family Member",
                                                    )),
                                          );
                                        },
                                        child: SizedBox(
                                          height: 150,
                                          width: width * 0.3,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  topLeft: Radius.circular(10)),
                                            ),
                                            color: Colors.green,
                                            margin: EdgeInsets.all(0),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text("family member"),
                                                  Text("${y.length}")
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              width: width - width * 0.3 - 30,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                margin: EdgeInsets.all(0),
                                                child: Center(
                                                    child: Text(
                                                        "your family members are")),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              width: width - width * 0.3 - 30,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                color: Colors.lightBlueAccent,
                                                margin: EdgeInsets.all(0),
                                                child: Center(
                                                    child: Text(
                                                        "chose your friends")),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                width: width,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  margin: EdgeInsets.all(10),
                                  child: Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SideDrawer(
                                                        data: x,
                                                        buckitName: "Undifined",
                                                        clickEvet: _clikEvent)),
                                          );
                                        },
                                        child: SizedBox(
                                          height: 150,
                                          width: width * 0.3,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  topLeft: Radius.circular(10)),
                                            ),
                                            color: Colors.orange,
                                            margin: EdgeInsets.all(0),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text("Undifined"),
                                                  Text("${x.length}")
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              width: width - width * 0.3 - 30,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                ),
                                                margin: EdgeInsets.all(0),
                                                child: Center(
                                                    child: Text(
                                                        "choose your family members and relation")),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SideDrawer(
                                                              data: x,
                                                              buckitName:
                                                                  "Undifined",
                                                              clickEvet:
                                                                  _clikEvent)),
                                                );
                                              },
                                              child: SizedBox(
                                                width: width - width * 0.3 - 30,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10)),
                                                  ),
                                                  color: Colors.lightBlueAccent,
                                                  margin: EdgeInsets.all(0),
                                                  child: Center(
                                                      child: Text(
                                                          "choose from the list")),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: new Builder(builder: (context) {
        return new FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: new Icon(Icons.person),
        );
      }),
    );
  }

  _clikEvent(phone, relation) {
    FetchData().editRelation(file, phone, relation);
    getData();
  }
}
