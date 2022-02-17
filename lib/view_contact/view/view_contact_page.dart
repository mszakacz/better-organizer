import 'package:flutter/material.dart';
import 'package:better_organizer/view_contact/view_contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewContactPage extends StatelessWidget {
  const ViewContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewContactBloc, ViewContactState>(
      listenWhen: (previous, current) =>
          current.status != previous.status &&
          current.status == ViewContactStatus.deleted,
      listener: (context, state) => {
        if (state.status == ViewContactStatus.deleted)
          {
            Navigator.pop(context,
                'Contact (${state.contact.name} ${state.contact.lastname}) has been deleted.'),
            print(
                'Contact (${state.contact.name} ${state.contact.lastname}) has been deleted.'),
          }
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<ViewContactBloc, ViewContactState>(
            builder: (context, state) {
              return Text('${state.contact.name} ${state.contact.lastname}');
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<ViewContactBloc, ViewContactState>(
          builder: (context, state) {
            return ContactInformations(contact: state.contact);
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                key: const Key('viewContactPage_editContactButton'),
                child: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                heroTag: null,
                key: const Key('viewContactPage_deleteContactButton'),
                child: const Icon(Icons.delete),
                onPressed: () =>
                    context.read<ViewContactBloc>().add(DeleteContactEvent()),
                foregroundColor: Colors.red,
                backgroundColor: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
