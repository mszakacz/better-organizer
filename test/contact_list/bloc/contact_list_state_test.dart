import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/contact_list/contact_list.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

void main() {
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

  const mockContactsList2 = [
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
    Contact(
      id: '3',
      name: 'name3',
      lastname: 'lastname3',
      mobile: 'mobile3',
      mail: 'mail3',
      address: 'address3',
      description: 'description3',
    ),
  ];

  group('ContactListState', () {
    ContactListState createSubject({
      List<Contact> contactList = mockContactsList,
      List<Contact> visibleList = mockContactsList,
      String searchingWord = 'searchingWord',
      ContactListStatus status = ContactListStatus.loading,
    }) {
      return ContactListState(
        contactList: contactList,
        visibleList: visibleList,
        searchingWord: searchingWord,
        status: status,
      );
    }

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject(
          contactList: mockContactsList,
          visibleList: mockContactsList,
          searchingWord: 'searchingWord',
          status: ContactListStatus.success,
        ).props,
        equals(<Object?>[
          mockContactsList,
          mockContactsList,
          'searchingWord',
          ContactListStatus.success,
        ]),
      );
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(
            contactList: null,
            visibleList: null,
            searchingWord: null,
            status: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            contactList: mockContactsList2,
            visibleList: mockContactsList2,
            searchingWord: 'searchingWord2',
            status: ContactListStatus.failure,
          ),
          equals(
            createSubject(
              contactList: mockContactsList2,
              visibleList: mockContactsList2,
              searchingWord: 'searchingWord2',
              status: ContactListStatus.failure,
            ),
          ),
        );
      });
    });
  });
}
