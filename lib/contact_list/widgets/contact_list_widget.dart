import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:better_organizer/contact_list/contact_list.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactListBloc, ContactListState>(
      builder: (context, state) {
        if (state.status == ContactListStatus.success) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ContactListItem(contact: state.visibleList[index]),
            itemCount: state.visibleList.length,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
