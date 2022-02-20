// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/view_contact/view_contact.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

void main() {
  group('ViewContactEvent', () {
    final Contact contact = Contact(
      id: '1',
      name: 'name1',
      lastname: 'lastname1',
      mobile: 'mobile1',
      mail: 'mail1',
      address: 'address1',
      description: 'description1',
    );

    group('DeleteContactEvent', () {
      test('supports value equality', () {
        expect(
          DeleteContactEvent(),
          equals(DeleteContactEvent()),
        );
      });

      test('props are correct', () {
        expect(
          DeleteContactEvent().props,
          equals(<Object?>[]),
        );
      });
    });

    group('RefreshContactData', () {
      test('supports value equality', () {
        expect(
          RefreshContactData(),
          equals(RefreshContactData()),
        );
      });

      test('props are correct', () {
        expect(
          RefreshContactData().props,
          equals(<Object?>[]),
        );
      });
    });

    group('GetContact', () {
      test('supports value equality', () {
        expect(
          GetContact(id: contact.id),
          equals(
            GetContact(id: contact.id),
          ),
        );
      });

      test('props are correct', () {
        expect(
          GetContact(id: contact.id).props,
          equals(<Object?>[contact.id]),
        );
      });
    });
  });
}
