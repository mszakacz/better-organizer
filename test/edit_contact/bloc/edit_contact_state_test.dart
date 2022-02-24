import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/edit_contact/edit_contact.dart';
import 'package:contacts_repository/contacts_repository.dart';

void main() {
  final mockContact = Contact(
    id: '1',
    name: 'name1',
    lastname: 'lastname1',
    mobile: 'mobile1',
    mail: 'mail1',
    address: 'address1',
    description: 'description1',
  );

  final mockContact2 = Contact(
    id: '2',
    name: 'name2',
    lastname: 'lastname2',
    mobile: 'mobile2',
    mail: 'mail2',
    address: 'address2',
    description: 'description2',
  );

  group('EditContactState', () {
    EditContactState createSubject({
      EditContactStatus status = EditContactStatus.editing,
      Contact? contact,
    }) {
      return EditContactState(
        status: status,
        contact: contact ?? mockContact,
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
          contact: mockContact,
          status: EditContactStatus.editing,
        ).props,
        equals(<Object?>[
          EditContactStatus.editing, // status
          mockContact, // contact
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
            contact: null,
            status: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
              contact: mockContact2, status: EditContactStatus.posting),
          equals(
            createSubject(
              contact: mockContact2,
              status: EditContactStatus.posting,
            ),
          ),
        );
      });
    });
  });
}
