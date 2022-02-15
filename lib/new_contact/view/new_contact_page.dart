import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../bloc/new_contact_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Contact'),
      ),
      body: BlocBuilder<NewContactBloc, NewContactState>(
        builder: (context, state) {
          switch (state.status) {
            case NewContactStatus.open:
              return const NewContactForm();

            case NewContactStatus.failure:
              return const Center(
                  child: Text(
                'Failed to add a New Contact',
              ));

            case NewContactStatus.success:
              return const Center(
                  child: Text(
                'New contact has been created and posted successfully',
              ));

            default:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 50),
                    Text('Posting the User...'),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
