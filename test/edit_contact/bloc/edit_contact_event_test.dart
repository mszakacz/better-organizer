// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/edit_contact/edit_contact.dart';
import 'package:contacts_repository/contacts_repository.dart';

void main() {
  group('NewContactEvent', () {
    final mockContact = Contact(
      id: '1',
      name: 'name1',
      lastname: 'lastname1',
      mobile: 'mobile1',
      mail: 'mail1',
      address: 'address1',
      description: 'description1',
    );

    group('GetContact', () {
      test('supports value equality', () {
        expect(
          GetContact(contact: mockContact),
          equals(GetContact(contact: mockContact)),
        );
      });

      test('props are correct', () {
        expect(
          GetContact(contact: mockContact).props,
          equals(<Object?>[mockContact]), // contact
        );
      });
    });

    group('SaveChanges', () {
      test('supports value equality', () {
        expect(
          SaveChanges(),
          equals(SaveChanges()),
        );
      });

      test('props are correct', () {
        expect(
          SaveChanges().props,
          equals(<Object?>[]),
        );
      });
    });

    group('NameEditing', () {
      test('supports value equality', () {
        expect(
          NameEditing('name'),
          equals(NameEditing('name')),
        );
      });

      test('props are correct', () {
        expect(
          NameEditing('name').props,
          equals(<Object?>['name']),
        );
      });
    });

    group('LastnameEditing', () {
      test('supports value equality', () {
        expect(
          LastnameEditing('lastname'),
          equals(
            LastnameEditing('lastname'),
          ),
        );
      });

      test('props are correct', () {
        expect(
          LastnameEditing('lastname').props,
          equals(<Object?>['lastname']),
        );
      });
    });

    group('MobileEditing', () {
      test('supports value equality', () {
        expect(
          MobileEditing('mobile'),
          equals(MobileEditing('mobile')),
        );
      });

      test('props are correct', () {
        expect(
          MobileEditing('mobile').props,
          equals(<Object?>['mobile']),
        );
      });
    });

    group('MailEditing', () {
      test('supports value equality', () {
        expect(
          MailEditing('mail'),
          equals(MailEditing('mail')),
        );
      });

      test('props are correct', () {
        expect(
          MailEditing('mail').props,
          equals(<Object?>['mail']),
        );
      });
    });

    group('AddressEditing', () {
      test('supports value equality', () {
        expect(
          AddressEditing('address'),
          equals(AddressEditing('address')),
        );
      });

      test('props are correct', () {
        expect(
          AddressEditing('address').props,
          equals(<Object?>['address']),
        );
      });
    });

    group('DesctriptionEditing', () {
      test('supports value equality', () {
        expect(
          DesctriptionEditing('description'),
          equals(DesctriptionEditing('description')),
        );
      });

      test('props are correct', () {
        expect(
          DesctriptionEditing('description').props,
          equals(<Object?>['description']),
        );
      });
    });
  });
}
