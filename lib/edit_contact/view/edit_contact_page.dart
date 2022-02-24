import 'package:flutter/material.dart';
import 'package:contacts_repository/contacts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:better_organizer/edit_contact/edit_contact.dart';

class EditContactPage extends StatelessWidget {
  const EditContactPage({Key? key, required this.contact}) : super(key: key);
  final Contact contact;

  static Route<void> route(Contact contact) {
    return MaterialPageRoute(
      builder: (context) => EditContactPage(contact: contact),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditContactBloc>(
      create: (context) => EditContactBloc(
          contactsRepository:
              RepositoryProvider.of<ContactsRepository>(context))
        ..add(GetContact(contact: contact)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${contact.name} ${contact.lastname}'),
        ),
        body: EditContactForm(contact: contact),
      ),
    );
  }
}
