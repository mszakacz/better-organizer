// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/new_contact/new_contact.dart';

void main() {
  group('NewContactEvent', () {
    final String name = 'name1';
    final String lastname = 'lastname1';
    final String mobile = 'mobile1';
    final String mail = 'mail1';
    final String address = 'address1';
    final String description = 'description1';

    group('AddContact', () {
      test('supports value equality', () {
        expect(
          AddContact(),
          equals(AddContact()),
        );
      });

      test('props are correct', () {
        expect(
          AddContact().props,
          equals(<Object?>[]),
        );
      });
    });

    group('NameEditing', () {
      test('supports value equality', () {
        expect(
          NameEditing(name),
          equals(NameEditing(name)),
        );
      });

      test('props are correct', () {
        expect(
          NameEditing(name).props,
          equals(<Object?>[name]),
        );
      });
    });

    group('LastnameEditing', () {
      test('supports value equality', () {
        expect(
          LastnameEditing(lastname),
          equals(
            LastnameEditing(lastname),
          ),
        );
      });

      test('props are correct', () {
        expect(
          LastnameEditing(lastname).props,
          equals(<Object?>[lastname]),
        );
      });
    });

    group('MobileEditing', () {
      test('supports value equality', () {
        expect(
          MobileEditing(mobile),
          equals(MobileEditing(mobile)),
        );
      });

      test('props are correct', () {
        expect(
          MobileEditing(mobile).props,
          equals(<Object?>[mobile]),
        );
      });
    });

    group('MailEditing', () {
      test('supports value equality', () {
        expect(
          MailEditing(mail),
          equals(MailEditing(mail)),
        );
      });

      test('props are correct', () {
        expect(
          MailEditing(mail).props,
          equals(<Object?>[mail]),
        );
      });
    });

    group('AddressEditing', () {
      test('supports value equality', () {
        expect(
          AddressEditing(address),
          equals(AddressEditing(address)),
        );
      });

      test('props are correct', () {
        expect(
          AddressEditing(address).props,
          equals(<Object?>[address]),
        );
      });
    });

    group('DesctriptionEditing', () {
      test('supports value equality', () {
        expect(
          DesctriptionEditing(description),
          equals(DesctriptionEditing(description)),
        );
      });

      test('props are correct', () {
        expect(
          DesctriptionEditing(description).props,
          equals(<Object?>[description]),
        );
      });
    });
  });
}
