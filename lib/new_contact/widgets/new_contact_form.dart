import 'package:flutter/material.dart';
import '../bloc/new_contact_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewContactForm extends StatelessWidget {
  const NewContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: BlocBuilder<NewContactBloc, NewContactState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Icon(Icons.phone),
                  ),
                  Flexible(
                    child: TextFormField(
                      // controller: _nameTextController,
                      onChanged: (value) =>
                          BlocProvider.of<NewContactBloc>(context)
                              .add(MailEditing(value)),
                      decoration: const InputDecoration(
                        labelText: 'Mobile',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
