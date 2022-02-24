import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/new_contact/new_contact.dart';
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

  group('NewContactBloc', () {
    late ContactsRepository contactsRepository;

    setUpAll(() {
      registerFallbackValue(
        FakeContact(),
      );
    });

    setUp(() {
      contactsRepository = MockContactRepository();

      when(
        () => contactsRepository.addNewContact(
          any(),
        ),
      ).thenAnswer(
        (_) async {},
      );
    });

    NewContactBloc buildBloc() {
      return NewContactBloc(contactsRepository: contactsRepository);
    }

    group('constructor', () {
      test(
        'works properly',
        () => expect(buildBloc, returnsNormally),
      );

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const NewContactState(
            contact: Contact(),
            status: NewContactStatus.open,
          )),
        );
      });
    });

    group('NameEditing', () {
      blocTest<NewContactBloc, NewContactState>(
        'emits new state with updated contact name',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const NameEditing('newname'),
        ),
        expect: () => const [
          NewContactState(
            status: NewContactStatus.open,
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
      blocTest<NewContactBloc, NewContactState>(
        'emits new state with updated contact lastname',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const LastnameEditing('newLastname'),
        ),
        expect: () => const [
          NewContactState(
            status: NewContactStatus.open,
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
      blocTest<NewContactBloc, NewContactState>(
        'emits new state with updated contact mobile',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const MobileEditing('newMobile'),
        ),
        expect: () => const [
          NewContactState(
            status: NewContactStatus.open,
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
      blocTest<NewContactBloc, NewContactState>(
        'emits new state with updated contact mail',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const MailEditing('newMail'),
        ),
        expect: () => const [
          NewContactState(
            status: NewContactStatus.open,
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
      blocTest<NewContactBloc, NewContactState>(
        'emits new state with updated contact address',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const AddressEditing('newAddress'),
        ),
        expect: () => const [
          NewContactState(
            status: NewContactStatus.open,
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
      blocTest<NewContactBloc, NewContactState>(
        'emits new state with updated contact address',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const DesctriptionEditing('newDescription'),
        ),
        expect: () => const [
          NewContactState(
            status: NewContactStatus.open,
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

    group('AddContact', () {
      blocTest<NewContactBloc, NewContactState>(
        'attempts to save new contact to repository',
        setUp: () {
          when(
            () => contactsRepository.addNewContact(
              any(),
            ),
          ).thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => NewContactState(
          contact: mockContact,
          status: NewContactStatus.open,
        ),
        act: (bloc) => bloc.add(
          const AddContact(),
        ),
        expect: () => [
          NewContactState(
            status: NewContactStatus.posting,
            contact: mockContact,
          ),
          NewContactState(
            status: NewContactStatus.success,
            contact: mockContact,
          ),
          const NewContactState(
            status: NewContactStatus.open,
            contact: Contact(),
          ),
        ],
        verify: (bloc) {
          verify(
            () => contactsRepository.addNewContact(
              any(
                that: isA<Contact>()
                    .having((c) => c.id, '1', equals('1'))
                    .having(
                      (c) => c.name,
                      'name1',
                      equals('name1'),
                    )
                    .having(
                      (c) => c.lastname,
                      'lastname1',
                      equals('lastname1'),
                    )
                    .having(
                      (c) => c.mobile,
                      'mobile1',
                      equals('mobile1'),
                    )
                    .having(
                      (c) => c.mail,
                      'mail1',
                      equals('mail1'),
                    )
                    .having(
                      (c) => c.address,
                      'address1',
                      equals('address1'),
                    )
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

      blocTest<NewContactBloc, NewContactState>(
        'emits new state with error if save to repository fails',
        build: () {
          when(
            () => contactsRepository.addNewContact(
              any(),
            ),
          ).thenThrow(Exception('oops'));
          return buildBloc();
        },
        seed: () => NewContactState(
          contact: mockContact,
          status: NewContactStatus.open,
        ),
        act: (bloc) => bloc.add(
          const AddContact(),
        ),
        expect: () => [
          NewContactState(
            status: NewContactStatus.posting,
            contact: mockContact,
          ),
          NewContactState(
            status: NewContactStatus.failure,
            contact: mockContact,
          ),
        ],
      );
    });
  });
}
