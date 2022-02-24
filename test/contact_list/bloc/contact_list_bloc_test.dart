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
        'listening to the Stream and GetContactEvent',
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
  });
}
