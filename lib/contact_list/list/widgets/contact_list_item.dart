import 'package:flutter/material.dart';
import 'package:better_organizer/contact_list/example/models/contact.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;
  const ContactListItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: Text(
          '${contact.name} ${contact.lastname}',
        ),
      ),
    );
  }
}
