import 'package:flutter/material.dart';
import 'package:contacts_repository/contacts_repository.dart';
import 'package:better_organizer/view_contact/view_contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;

  const ContactListItem({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
          title: Text(
            '${contact.name} ${contact.lastname}',
          ),
          onTap: () {
            context.read<ViewContactBloc>().add(GetContact(id: contact.id));
            Navigator.of(context).push(ViewContactPage.route());
          }),
    );
  }
}
