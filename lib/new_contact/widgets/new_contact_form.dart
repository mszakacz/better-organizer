import 'package:flutter/material.dart';
import '../bloc/new_contact_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewContactForm extends StatelessWidget {
  const NewContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: BlocBuilder<NewContactBloc, NewContactState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Icon(Icons.person),
                  ),
                  Flexible(
                    child: TextFormField(
                      onChanged: (value) =>
                          BlocProvider.of<NewContactBloc>(context)
                              .add(NameEditing(value)),
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: TextFormField(
                      onChanged: (value) =>
                          BlocProvider.of<NewContactBloc>(context)
                              .add(LastnameEditing(value)),
                      decoration: const InputDecoration(
                        labelText: 'Lastname',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Icon(Icons.phone),
                  ),
                  Flexible(
                    child: TextFormField(
                      onChanged: (value) =>
                          BlocProvider.of<NewContactBloc>(context)
                              .add(MobileEditing(value)),
                      decoration: const InputDecoration(
                        labelText: 'Mobile',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Icon(Icons.mail),
                  ),
                  Flexible(
                    child: TextFormField(
                      onChanged: (value) =>
                          BlocProvider.of<NewContactBloc>(context)
                              .add(MailEditing(value)),
                      decoration: const InputDecoration(
                        labelText: 'Mail',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Icon(Icons.location_pin),
                  ),
                  Flexible(
                    child: TextFormField(
                      onChanged: (value) =>
                          BlocProvider.of<NewContactBloc>(context)
                              .add(AddressEditing(value)),
                      decoration: const InputDecoration(
                        labelText: 'Address',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<NewContactBloc>(context).add(AddContact());
                },
                child: const Text('Crerate'),
              ),
            ],
          );
        },
      ),
    );
  }
}
