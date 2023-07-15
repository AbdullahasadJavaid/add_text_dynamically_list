import 'dart:math';
import 'package:flutter/material.dart';
import '/ProviderModel/contactmodel.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);

    return ListView.builder(
      itemCount: contactProvider.list.length,
      itemBuilder: (context, index) {
        final contact = contactProvider.list[index];

        return ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ),
          title: Text("${contact.fname} ${contact.lname}"),
          subtitle: Text(contact.number),
          trailing: IconButton(
            onPressed: () {
              contactProvider.deleteContact(contact.id);
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
