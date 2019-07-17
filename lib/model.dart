class ContactList {
  List<Contact> contacts;

  ContactList({this.contacts});

  factory ContactList.fromJson(List<dynamic> parsedJson) {
    // parsedJson = decoded json object

    List<Contact> contacts = List<Contact>();
    contacts = parsedJson.map((i) => Contact.fromJson(i)).toList();

    return ContactList(
      contacts: contacts,
    );
  }
}

class Contact {
  String firstname;
  String lastname;
  String email;
  String phone;
  String location;
  String age;
  String relation;

  Contact(
      {this.firstname,
      this.lastname,
      this.email,
      this.phone,
      this.location,
      this.age,
      this.relation});

  factory Contact.fromJson(Map<String, dynamic> parseingJson) {
    return Contact(
        firstname: parseingJson['firstname'],
        lastname: parseingJson['lastname'],
        email: parseingJson['email'],
        phone: parseingJson['phone'],
        location: parseingJson['location'],
        age: parseingJson['age'],
        relation: parseingJson['relation']);
  }
  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phone': phone,
        'location': location,
        'age': age,
        'relation': relation
      };

  static List encodeToJson(List<Contact> list) {
    List jsonList = List();
    list.map((item) => jsonList.add(item.toJson())).toList();
    return jsonList;
  }
}
