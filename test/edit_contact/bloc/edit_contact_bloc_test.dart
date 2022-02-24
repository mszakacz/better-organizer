import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/edit_contact/edit_contact.dart';
import 'package:mocktail/mocktail.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

class MockContactRepository extends Mock implements ContactsRepository {}

class FakeContact extends Fake implements Contact {}

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

  final Contact fetchedContact = Contact(
    id: '3',
    name: 'fetchedgetted',
    lastname: 'fetchedlastname1',
    mobile: 'fetchedmobile1',
    mail: 'fetchedmail1',
    address: 'fetchedaddress1',
    description: 'fetcheddescription1',
  );

  group('EditContactBloc', () {
    late ContactsRepository contactsRepository;

    setUpAll(() {
      registerFallbackValue(
        FakeContact(),
      );
    });

    setUp(() {
      contactsRepository = MockContactRepository();

      when(
        () => contactsRepository.editContact(
          any(),
        ),
      ).thenAnswer((_) async {});
    });

    EditContactBloc buildBloc() {
      return EditContactBloc(contactsRepository: contactsRepository);
    }

    group('constructor', () {
      test(
        'works properly',
        () => expect(buildBloc, returnsNormally),
      );

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(
            const EditContactState(
              contact: Contact(),
              status: EditContactStatus.editing,
            ),
          ),
        );
      });
    });

    group('GetContact', () {
      blocTest<EditContactBloc, EditContactState>(
        'emits new state with updated contact',
        build: buildBloc,
        act: (bloc) => bloc.add(
          GetContact(contact: fetchedContact),
        ),
        expect: () => [
          EditContactState(
            status: EditContactStatus.editing,
            contact: fetchedContact,
          ),
        ],
      );
    });

    group('SaveChanges', () {
      blocTest<EditContactBloc, EditContactState>(
        'attempts to save contact to repository',
        setUp: () {
          when(() => contactsRepository.editContact(any()))
              .thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => EditContactState(
          contact: mockContact,
          status: EditContactStatus.editing,
        ),
        act: (bloc) => bloc.add(const SaveChanges()),
        expect: () => [
          EditContactState(
            status: EditContactStatus.posting,
            contact: mockContact,
          ),
          EditContactState(
            status: EditContactStatus.success,
            contact: mockContact,
          ),
        ],
        verify: (bloc) {
          verify(
            () => contactsRepository.editContact(
              any(
                that: isA<Contact>()
                    .having((c) => c.id, '1', equals('1'))
                    .having((c) => c.name, 'name1', equals('name1'))
                    .having((c) => c.lastname, 'lastname1', equals('lastname1'))
                    .having((c) => c.mobile, 'mobile1', equals('mobile1'))
                    .having((c) => c.mail, 'mail1', equals('mail1'))
                    .having((c) => c.address, 'address1', equals('address1'))
                    .having(
                      (c) => c.description,
                      'description1',
                      equals('description1'),
                    ),
              ),
            ),
          );
        },
      );

      blocTest<EditContactBloc, EditContactState>(
        'emits new state with error if save to repository fails',
        build: () {
          when(
            () => contactsRepository.editContact(
              any(),
            ),
          ).thenThrow(Exception('oops'));
          return buildBloc();
        },
        seed: () => EditContactState(
          contact: mockContact,
          status: EditContactStatus.editing,
        ),
        act: (bloc) => bloc.add(
          const SaveChanges(),
        ),
        expect: () => [
          EditContactState(
            status: EditContactStatus.posting,
            contact: mockContact,
          ),
          EditContactState(
            status: EditContactStatus.failure,
            contact: mockContact,
          ),
        ],
      );
    });

    group('NameEditing', () {
      blocTest<EditContactBloc, EditContactState>(
        'emits new state with updated contact name',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const NameEditing('newname'),
        ),
        expect: () => const [
          EditContactState(
            status: EditContactStatus.editing,
            contact: Contact(
              id: '',
              name: 'newname',
              lastname: '',
              mobile: '',
              mail: '',
              address: '',
              description: '',
            ),
          ),
        ],
      );
    });

    group('LastnameEditing', () {
      blocTest<EditContactBloc, EditContactState>(
        'emits new state with updated contact lastname',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const LastnameEditing('newLastname'),
        ),
        expect: () => const [
          EditContactState(
            status: EditContactStatus.editing,
            contact: Contact(
              id: '',
              name: '',
              lastname: 'newLastname',
              mobile: '',
              mail: '',
              address: '',
              description: '',
            ),
          ),
        ],
      );
    });

    group('MobileEditing', () {
      blocTest<EditContactBloc, EditContactState>(
        'emits new state with updated contact mobile',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const MobileEditing('newMobile'),
        ),
        expect: () => const [
          EditContactState(
            status: EditContactStatus.editing,
            contact: Contact(
              id: '',
              name: '',
              lastname: '',
              mobile: 'newMobile',
              mail: '',
              address: '',
              description: '',
            ),
          ),
        ],
      );
    });

    group('MailEditing', () {
      blocTest<EditContactBloc, EditContactState>(
        'emits new state with updated contact mail',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const MailEditing('newMail'),
        ),
        expect: () => const [
          EditContactState(
            status: EditContactStatus.editing,
            contact: Contact(
              id: '',
              name: '',
              lastname: '',
              mobile: '',
              mail: 'newMail',
              address: '',
              description: '',
            ),
          ),
        ],
      );
    });

    group('AddressEditing', () {
      blocTest<EditContactBloc, EditContactState>(
        'emits new state with updated contact address',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const AddressEditing('newAddress'),
        ),
        expect: () => const [
          EditContactState(
            status: EditContactStatus.editing,
            contact: Contact(
              id: '',
              name: '',
              lastname: '',
              mobile: '',
              mail: '',
              address: 'newAddress',
              description: '',
            ),
          ),
        ],
      );
    });

    group('DesctriptionEditing', () {
      blocTest<EditContactBloc, EditContactState>(
        'emits new state with updated contact address',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const DesctriptionEditing('newDescription'),
        ),
        expect: () => const [
          EditContactState(
            status: EditContactStatus.editing,
            contact: Contact(
              id: '',
              name: '',
              lastname: '',
              mobile: '',
              mail: '',
              address: '',
              description: 'newDescription',
            ),
          ),
        ],
      );
    });
  });
}
