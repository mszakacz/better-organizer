import 'package:flutter/material.dart';
import 'contact_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/contact_list_bloc.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactListBloc, ContactListState>(
      builder: (context, state) {
        if (state is HasContactListState) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ContactListItem(contact: state.contactList[index]),
            itemCount: state.contactList.length,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
