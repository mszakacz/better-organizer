import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/contact_list/contact_list.dart';
import 'package:mocktail/mocktail.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

class MockContactListRepository extends Mock implements ContactListRepository {}

class FakeContact extends Fake implements Contact {}

void main() {
  group('ContactListBloc', () {
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

    late ContactListRepository contactListRepository;

    setUpAll(() {
      registerFallbackValue(<FakeContact>[]);
    });

    ContactListBloc buildBloc() {
      return ContactListBloc(contactListRepository: contactListRepository)
        ..add(const GetContactListEvent(contactList: mockContactsList));
    }

    group('constructor', () {
      setUp(() {
        contactListRepository = MockContactListRepository();

        when(() => contactListRepository.contactList())
            .thenAnswer((contacts) => const Stream.empty());
      });

      test('works properly', () => expect(buildBloc, returnsNormally));

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const ContactListState(
            status: ContactListStatus.loading,
            contactList: <Contact>[],
            visibleList: <Contact>[],
            searchingWord: '',
          )),
        );
      });

      blocTest(
        'listening to the Stream',
        build: buildBloc,
        expect: () => [
          const ContactListState(
            status: ContactListStatus.loading,
            contactList: <Contact>[],
            visibleList: <Contact>[],
            searchingWord: '',
          ),
          const ContactListState(
            status: ContactListStatus.success,
            contactList: mockContactsList,
            visibleList: mockContactsList,
            searchingWord: '',
          ),
        ],
      );
    });

    // group('GetContactListEvent', () {
    //   blocTest<ContactListBloc, ContactListState>(
    //     'emits new state with updated contact List',
    //     build: buildBloc,
    //     act: (bloc) => bloc.add(
    //       GetContactListEvent(contactList: fetchedContact),
    //     ),
    //     expect: () => [
    //       EditContactState(
    //         status: EditContactStatus.editing,
    //         contact: fetchedContact,
    //       ),
    //     ],
    //   );
    // });

    // group('SaveChanges', () {
    //   blocTest<EditContactBloc, EditContactState>(
    //     'attempts to save contact to repository',
    //     setUp: () {
    //       when(() => contactRepository.editContact(any()))
    //           .thenAnswer((_) async {});
    //     },
    //     build: buildBloc,
    //     seed: () => EditContactState(
    //       contact: mockContact,
    //       status: EditContactStatus.editing,
    //     ),
    //     act: (bloc) => bloc.add(const SaveChanges()),
    //     expect: () => [
    //       EditContactState(
    //         status: EditContactStatus.posting,
    //         contact: mockContact,
    //       ),
    //       EditContactState(
    //         status: EditContactStatus.success,
    //         contact: mockContact,
    //       ),
    //     ],
    //     verify: (bloc) {
    //       verify(
    //         () => contactRepository.editContact(
    //           any(
    //               that: isA<Contact>()
    //                   .having((c) => c.id, '1', equals('1'))
    //                   .having((c) => c.name, 'name1', equals('name1'))
    //                   .having(
    //                       (c) => c.lastname, 'lastname1', equals('lastname1'))
    //                   .having((c) => c.mobile, 'mobile1', equals('mobile1'))
    //                   .having((c) => c.mail, 'mail1', equals('mail1'))
    //                   .having((c) => c.address, 'address1', equals('address1'))
    //                   .having((c) => c.description, 'description1',
    //                       equals('description1'))),
    //         ),
    //       );
    //     },
    //   );

    //   blocTest<EditContactBloc, EditContactState>(
    //     'emits new state with error if save to repository fails',
    //     build: () {
    //       when(() => contactRepository.editContact(any()))
    //           .thenThrow(Exception('oops'));
    //       return buildBloc();
    //     },
    //     seed: () => EditContactState(
    //       contact: mockContact,
    //       status: EditContactStatus.editing,
    //     ),
    //     act: (bloc) => bloc.add(const SaveChanges()),
    //     expect: () => [
    //       EditContactState(
    //         status: EditContactStatus.posting,
    //         contact: mockContact,
    //       ),
    //       EditContactState(
    //         status: EditContactStatus.failure,
    //         contact: mockContact,
    //       ),
    //     ],
    //   );
    // });

    group('SearchEvent', () {
      setUp(() {
        contactListRepository = MockContactListRepository();
        when(() => contactListRepository.contactList())
            .thenAnswer((contacts) => const Stream.empty());
      });

      blocTest<ContactListBloc, ContactListState>(
        'emits new state with updated visible contact list',
        build: buildBloc,
        act: (bloc) => bloc.add(
          const SearchEvent(searchingWord: 'name1'),
        ),
        expect: () => [
          const ContactListState(
            status: ContactListStatus.loading,
            contactList: <Contact>[],
            visibleList: <Contact>[],
            searchingWord: '',
          ),
          const ContactListState(
            status: ContactListStatus.success,
            contactList: mockContactsList,
            visibleList: mockContactsList,
            searchingWord: '',
          ),
          const ContactListState(
            status: ContactListStatus.loading,
            contactList: mockContactsList,
            visibleList: mockContactsList,
            searchingWord: '',
          ),
          ContactListState(
            status: ContactListStatus.success,
            contactList: mockContactsList,
            visibleList: [mockContactsList[0]],
            searchingWord: 'name1',
          ),
        ],
      );
    });

    // group('LastnameEditing', () {
    //   blocTest<EditContactBloc, EditContactState>(
    //     'emits new state with updated contact lastname',
    //     build: buildBloc,
    //     act: (bloc) => bloc.add(const LastnameEditing('newLastname')),
    //     expect: () => const [
    //       EditContactState(
    //         status: EditContactStatus.editing,
    //         contact: Contact(
    //           id: '',
    //           name: '',
    //           lastname: 'newLastname',
    //           mobile: '',
    //           mail: '',
    //           address: '',
    //           description: '',
    //         ),
    //       ),
    //     ],
    //   );
    // });

    // group('MobileEditing', () {
    //   blocTest<EditContactBloc, EditContactState>(
    //     'emits new state with updated contact mobile',
    //     build: buildBloc,
    //     act: (bloc) => bloc.add(const MobileEditing('newMobile')),
    //     expect: () => const [
    //       EditContactState(
    //         status: EditContactStatus.editing,
    //         contact: Contact(
    //           id: '',
    //           name: '',
    //           lastname: '',
    //           mobile: 'newMobile',
    //           mail: '',
    //           address: '',
    //           description: '',
    //         ),
    //       ),
    //     ],
    //   );
    // });

    // group('MailEditing', () {
    //   blocTest<EditContactBloc, EditContactState>(
    //     'emits new state with updated contact mail',
    //     build: buildBloc,
    //     act: (bloc) => bloc.add(const MailEditing('newMail')),
    //     expect: () => const [
    //       EditContactState(
    //         status: EditContactStatus.editing,
    //         contact: Contact(
    //           id: '',
    //           name: '',
    //           lastname: '',
    //           mobile: '',
    //           mail: 'newMail',
    //           address: '',
    //           description: '',
    //         ),
    //       ),
    //     ],
    //   );
    // });

    // group('AddressEditing', () {
    //   blocTest<EditContactBloc, EditContactState>(
    //     'emits new state with updated contact address',
    //     build: buildBloc,
    //     act: (bloc) => bloc.add(const AddressEditing('newAddress')),
    //     expect: () => const [
    //       EditContactState(
    //         status: EditContactStatus.editing,
    //         contact: Contact(
    //           id: '',
    //           name: '',
    //           lastname: '',
    //           mobile: '',
    //           mail: '',
    //           address: 'newAddress',
    //           description: '',
    //         ),
    //       ),
    //     ],
    //   );
    // });

    // group('DesctriptionEditing', () {
    //   blocTest<EditContactBloc, EditContactState>(
    //     'emits new state with updated contact address',
    //     build: buildBloc,
    //     act: (bloc) => bloc.add(const DesctriptionEditing('newDescription')),
    //     expect: () => const [
    //       EditContactState(
    //         status: EditContactStatus.editing,
    //         contact: Contact(
    //           id: '',
    //           name: '',
    //           lastname: '',
    //           mobile: '',
    //           mail: '',
    //           address: '',
    //           description: 'newDescription',
    //         ),
    //       ),
    //     ],
    //   );
    // });
  });
}
