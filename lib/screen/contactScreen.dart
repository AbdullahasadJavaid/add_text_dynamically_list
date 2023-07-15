import 'package:flutter/material.dart';
import '/ProviderModel/contactmodel.dart';
import '/ProviderModel/themeChanger.dart';
import '/widgets/inputfeild.dart';
import '../widgets/mylist.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key}) : super(key: key);

  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
        actions: [
          Consumer<themechange>(
            builder: (context, change, _) {
              return IconButton(
                  onPressed: () {
                    change.toggleTheme();
                  },
                  icon: Icon(Icons.sunny));
            },
          ),
        ],
      ),
      body: ContactList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext ctx) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InputFields(
                      fname: fname,
                      lname: lname,
                      number: number,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final addContact = Provider.of<ContactProvider>(context,
                            listen: false);
                        addContact.addContact(
                          DateTime.now().toString(),
                          fname.text,
                          lname.text,
                          number.text,
                        );
                        fname.text = '';
                        lname.text = '';
                        number.text = '';
                        Navigator.pop(context);
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
