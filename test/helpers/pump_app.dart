import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:contacts_repository/contacts_repository.dart';
import 'package:better_organizer/contact_list/contact_list.dart';
import 'package:better_organizer/view_contact/view_contact.dart';
import 'package:better_organizer/app/app.dart';

class MockContactsRepository extends Mock implements ContactsRepository {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    ContactsRepository? contactsRepository,
  }) {
    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ContactsRepository>.value(
            value: contactsRepository ?? MockContactsRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ViewContactBloc(
                  contactsRepository:
                      RepositoryProvider.of<ContactsRepository>(context)),
            ),
          ],
          child: MaterialApp(
            title: 'Better Organizer',
            home: Scaffold(
              body: widget,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pumpRoute(
    Route<dynamic> route, {
    ContactsRepository? contactsRepository,
  }) {
    return pumpApp(
      Navigator(onGenerateRoute: (_) => route),
      contactsRepository: contactsRepository,
    );
  }
}
