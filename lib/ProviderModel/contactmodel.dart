import 'package:flutter/material.dart';

class Contact {
  final String id;
  final String fname;
  final String lname;
  final String number;

  Contact(this.id, this.fname, this.lname, this.number);
}

class ContactProvider with ChangeNotifier {
  final List<Contact> _list = [];

  List<Contact> get list {
    return [..._list];
  }

  void addContact(String id, String fname, String lname, String number) {
    _list.add(Contact(id, fname, lname, number));
    notifyListeners();
  }

  void deleteContact(String id) {
    _list.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}