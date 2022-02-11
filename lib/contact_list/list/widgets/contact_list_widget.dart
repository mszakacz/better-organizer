import 'package:flutter/material.dart';
import 'contact_list_item.dart';
import 'package:better_organizer/contact_list/example/examplary_list.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          ContactListItem(contact: list[index]),
      itemCount: list.length,
    );
  }
}
