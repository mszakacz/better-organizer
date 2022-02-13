import 'package:flutter/material.dart';
import 'package:contact_list_repository/contact_list_repository.dart';
import 'package:better_organizer/app/app.dart';

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
        onTap: () =>
            Navigator.of(context).pushNamed('view_contact', arguments: contact),
      ),
    );
  }
}
