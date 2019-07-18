

import 'package:flutter/material.dart';
import 'package:simple_contact/model.dart';

class ContactListScreen extends StatefulWidget {
  final List<Contact> unidentified;
  final List<Contact> related;
  ContactListScreen({@required this.unidentified, @required this.related});

  @override
  ContactListScreenState createState() => ContactListScreenState();
}

class ContactListScreenState extends State<ContactListScreen> {
  List<Contact> displayList = [];

  @override
  void initState() {
    super.initState();
    displayList.add(Contact(relation: "Heading"));
    displayList.add(Contact(relation: "TypeField1"));
    widget.related.forEach((f) => displayList.add(f));
    displayList.add(Contact(relation: "TypeField2"));
    widget.unidentified.forEach((f) => displayList.add(f));

    // initfn();
  }

  Widget _buildItem(Contact contact) {
    if (contact.relation == "Heading")
      return Container(
        margin: EdgeInsets.fromLTRB(5, 5.0, 0.0, 5),
        height: 75,
        child: Text(
          'Contacts',
          textScaleFactor: 2.0,
        ),
      );

    if (contact.relation == "TypeField1")
      return Container(
        margin: EdgeInsets.fromLTRB(5, 5.0, 0.0, 5),
        height: 75,
        child: Text('Family Members (${widget.related.length})',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            )),
      );
    if (contact.relation == "TypeField2")
      return Container(
        margin: EdgeInsets.fromLTRB(5, 10.0, 0.0, 5),
        height: 25,
        child: Text('Unidentified (${widget.unidentified.length})',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            )),
      );
    return SizedBox(
      // margin: EdgeInsets.fromLTRB(5, 5.0, 0.0, 5),
      height: 100,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(contact.firstname + ' ' + contact.lastname,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                )),
            contact.relation == ""
                ? Container()
                : Card(
                    color: Colors.green,
                    child: Text(contact.relation),
                  ),
            Text(
              contact.email,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            Text(
              contact.phone,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.fromLTRB(10, 10.0, 10.0, 0.0),
            child: ListView(
              children:
                  displayList.map((f) => _buildItem(f)).toList(growable: false),
            )));
  }
}
