import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/view_contact/view_contact.dart';
import 'package:mocktail/mocktail.dart';
import 'package:contacts_repository/contacts_repository.dart';

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

  group('ViewContactBloc', () {
    late ContactsRepository contactsRepository;

    setUpAll(() {
      registerFallbackValue(
        FakeContact(),
      );
    });

    setUp(() {
      contactsRepository = MockContactRepository();

      when(
        () => contactsRepository.deleteContact(
          any(),
        ),
      ).thenAnswer(
        (_) async {},
      );
    });

    ViewContactBloc buildBloc() {
      return ViewContactBloc(contactsRepository: contactsRepository);
    }

    group('constructor', () {
      test(
        'works properly',
        () => expect(buildBloc, returnsNormally),
      );

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const ViewContactState(
            contact: Contact(),
            status: ViewContactStatus.success,
          )),
        );
      });
    });

    group('DeleteContactEvent', () {
      blocTest<ViewContactBloc, ViewContactState>(
        'attempts to delete contact with repository',
        setUp: () {
          when(
            () => contactsRepository.deleteContact(
              any(),
            ),
          ).thenAnswer(
            (_) async {},
          );
        },
        build: buildBloc,
        seed: () => ViewContactState(
          contact: mockContact,
          status: ViewContactStatus.success,
        ),
        act: (bloc) => bloc.add(
          const DeleteContactEvent(),
        ),
        expect: () => [
          ViewContactState(
            status: ViewContactStatus.loading,
            contact: mockContact,
          ),
          ViewContactState(
            status: ViewContactStatus.deleted,
            contact: mockContact,
          ),
        ],
        verify: (bloc) {
          verify(
            () => contactsRepository.deleteContact(
              any(
                that: isA<String>(),
              ),
            ),
          );
        },
      );

      blocTest<ViewContactBloc, ViewContactState>(
        'emits new state with error if deletion fails',
        build: () {
          when(
            () => contactsRepository.deleteContact(
              any(),
            ),
          ).thenThrow(Exception('oops'));
          return buildBloc();
        },
        seed: () => ViewContactState(
          contact: mockContact,
          status: ViewContactStatus.success,
        ),
        act: (bloc) => bloc.add(
          const DeleteContactEvent(),
        ),
        expect: () => [
          ViewContactState(
            status: ViewContactStatus.loading,
            contact: mockContact,
          ),
          ViewContactState(
            status: ViewContactStatus.failure,
            contact: mockContact,
          ),
        ],
      );
    });

    group('GetContact', () {
      final editedContact = mockContact.copyWith(name: 'editedName');

      blocTest<ViewContactBloc, ViewContactState>(
        'emits new state with updated contact when successful',
        setUp: () {
          when(() => contactsRepository.getContact(any()))
              .thenAnswer((_) async => editedContact);
        },
        build: buildBloc,
        seed: () => ViewContactState(
          contact: mockContact,
          status: ViewContactStatus.success,
        ),
        act: (bloc) => bloc.add(
          GetContact(id: mockContact.id),
        ),
        expect: () => [
          ViewContactState(
            status: ViewContactStatus.loading,
            contact: mockContact,
          ),
          ViewContactState(
            status: ViewContactStatus.success,
            contact: editedContact,
          ),
        ],
        verify: (bloc) {
          verify(
            () => contactsRepository.getContact(
              any(
                that: isA<String>(),
              ),
            ),
          );
        },
      );

      blocTest<ViewContactBloc, ViewContactState>(
        'emits new state with error if getContact fails',
        build: () {
          when(
            () => contactsRepository.getContact(
              any(),
            ),
          ).thenThrow(Exception('oops'));
          return buildBloc();
        },
        seed: () => ViewContactState(
          contact: mockContact,
          status: ViewContactStatus.success,
        ),
        act: (bloc) => bloc.add(
          GetContact(id: mockContact.id),
        ),
        expect: () => [
          ViewContactState(
            status: ViewContactStatus.loading,
            contact: mockContact,
          ),
          ViewContactState(
            status: ViewContactStatus.failure,
            contact: mockContact,
          ),
        ],
      );
    });
  });
}
