import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final TextEditingController fname;
  final TextEditingController lname;
  final TextEditingController number;

  const InputFields({
    required this.fname,
    required this.lname,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: fname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: lname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Last Name',
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: TextField(
            controller: number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Number',
            ),
          ),
        ),
      ],
    );
  }
}
