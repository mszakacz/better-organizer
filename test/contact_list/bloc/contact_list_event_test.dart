// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/contact_list/contact_list.dart';
import 'package:contacts_repository/contacts_repository.dart';

void main() {
  group('ContactListEvent', () {
    const mockContactsList = [
      Contact(
        id: '1',
        name: 'name1',
        lastname: 'lastname1',
        mobile: 'mobile1',
        mail: 'mail1',
        address: 'address1',
        description: 'description1',
      ),
      Contact(
        id: '2',
        name: 'name2',
        lastname: 'lastname2',
        mobile: 'mobile2',
        mail: 'mail2',
        address: 'address2',
        description: 'description2',
      ),
    ];

    group('GetContactListEvent', () {
      test('supports value equality', () {
        expect(
          GetContactListEvent(contactList: mockContactsList),
          equals(
            GetContactListEvent(contactList: mockContactsList),
          ),
        );
      });

      test('props are correct', () {
        expect(
          GetContactListEvent(contactList: mockContactsList).props,
          equals(
            <Object?>[mockContactsList], // contactList
          ),
        );
      });
    });

    group('SearchEvent', () {
      test('supports value equality', () {
        expect(
          SearchEvent(searchingWord: 'searchingWord'),
          equals(
            SearchEvent(searchingWord: 'searchingWord'),
          ),
        );
      });

      test('props are correct', () {
        expect(
          SearchEvent(searchingWord: 'searchingWord').props,
          equals(
            <Object?>['searchingWord'],
          ),
        );
      });
    });
  });
}
