import 'package:flutter/material.dart';
import 'package:simple_contact/screen/relation_adding_page.dart';
import '../model.dart';

enum Status { active, inactive }

class SideDrawer extends StatefulWidget {
  SideDrawer({Key key, this.data, this.buckitName, this.clickEvet})
      : super(key: key);
  List<Contact> data;
  String buckitName;
  Function clickEvet;
  @override
  SideDrawerState createState() => SideDrawerState();
}

class SideDrawerState extends State<SideDrawer> {
  List<Status> _statuses;

  @override
  void initState() {
    super.initState();
    initfn();
  }

  initfn() {
    getData();
  }

  getData() {
    _statuses = widget.data.map((a) => Status.inactive).toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    print("int the render slider ");
    print(widget.data);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.buckitName} (${widget.data.length})"),
        ),
        body: widget.data.length != 0
            ? new ListView.builder(
                itemCount: widget.data.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return SizedBox(
                    height: 110,
                    width: width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6)),
                      ),
                      // color: Colors.blue,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        color: _statuses[index] == Status.inactive
                            ? Colors.white
                            : Colors.greenAccent,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                child: Card(
                                  color: _statuses[index] == Status.inactive
                                      ? Colors.white
                                      : Colors.greenAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                      topLeft: Radius.circular(6),
                                    ),
                                  ),
                                  margin: EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                width:
                                                    (width - width * 0.3 - 10) *
                                                        .5,
                                                child: Text(
                                                    "${widget.data[index].firstname}")),
                                            Container()
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                color: _statuses[index] ==
                                                        Status.inactive
                                                    ? Colors.white
                                                    : Colors.greenAccent,
                                                width:
                                                    (width - width * 0.3) * .6,
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.email,
                                                      color: Colors.red,
                                                    ),
                                                    Text(
                                                        "${widget.data[index].email}")
                                                  ],
                                                )),
                                            Container(
                                                color: _statuses[index] ==
                                                        Status.inactive
                                                    ? Colors.white
                                                    : Colors.greenAccent,
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.call,
                                                      color: Colors.red,
                                                    ),
                                                    Text(
                                                        "${widget.data[index].phone}")
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // addingRelation(x[index].)
                                setState(() {
                                  _statuses[index] = Status.active;
                                });

                                new Future.delayed(new Duration(seconds: 1),
                                    () {
                                  // Navigator.pop(context); //pop dialog
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RelationAdding(
                                            data: widget.data[index],
                                            onPress: _clickEvent)),
                                  );
                                });
                              },
                              child: SizedBox(
                                height: 110,
                                width: width * 0.3,
                                child: Card(
                                  color: _statuses[index] == Status.inactive
                                      ? Colors.grey
                                      : Colors.green,
                                  margin: EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(6),
                                        bottomRight: Radius.circular(6)),
                                  ),
                                  child: widget.data[index].relation.length == 0
                                      ? Icon(Icons.arrow_forward)
                                      : Center(
                                          child: Text(
                                              "${widget.data[index].relation}"),
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: Text("Nothing to show"),
              ));
  }

  _clickEvent(phone, relation) {
    widget.clickEvet(phone, relation);
  }
}
