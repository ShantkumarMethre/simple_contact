import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_contact/model.dart';

class FetchData {
  static File _file;
  Directory dir;
  String fileName = "userData.json";
  bool fileExists = false;

  getFile() async {
    getExternalStorageDirectory().then((Directory directory) {
      dir = directory;
      _file = new File(dir.path + "/data/" + fileName);
      fileExists = _file.existsSync();
      if (!fileExists) {
        _file.createSync(recursive: true);
      }

      // if (_file.lengthSync() != 0) _read();
    });
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('lib/data.json');
  }

   Future<File> addInitial() async {
    getFile();
    String str = await loadAsset();
    print('str $str');
    var decodedJson = json.decode(str);
    List<Contact> contacts = ContactList.fromJson(decodedJson).contacts;
    List jsonList = Contact.encodeToJson(contacts);
    //write
    var json1 = json.encode(jsonList);
    _file.writeAsStringSync(json1);
    return _file;
  }

  void editRelation(file,String phone, String relation) {
  if (file.lengthSync() == 0) return null;
    final f2 = file.readAsStringSync();
    var decodedJson = json.decode(f2);
    List<Contact> contacts = ContactList.fromJson(decodedJson).contacts;
    contacts.forEach((f) {
      if (f.phone == phone) {
        print('got');
        f.relation = relation;
      }
    });

    List jsonList = Contact.encodeToJson(contacts);
    var json1 = json.encode(jsonList);
    file.writeAsStringSync(json1);
  }

  List<Contact> undefined(file){
    List<Contact> sorted=[];
    if (file.lengthSync() == 0) return null;
    final f2 = file.readAsStringSync();
    var decodedJson = json.decode(f2);
    List<Contact> contacts = ContactList.fromJson(decodedJson).contacts;
    contacts.forEach((f) {
      if (f.relation == "") {
        print('got');
        sorted.add(f);
      }
    });
    return sorted;
  }
  List<Contact> related(file){
    List<Contact> sorted=[];
    if (file.lengthSync() == 0) return null;
    final f2 = file.readAsStringSync();
    var decodedJson = json.decode(f2);
    List<Contact> contacts = ContactList.fromJson(decodedJson).contacts;
    contacts.forEach((f) {
      if (f.relation != "") {
        print('got');
        sorted.add(f);
      }
    });
    return sorted;
  }
}
