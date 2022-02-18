import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/view_contact/view_contact.dart';
import 'package:mocktail/mocktail.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

class MockContactRepository extends Mock implements ContactRepository {}

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
    late ContactRepository contactRepository;

    setUpAll(() {
      registerFallbackValue(FakeContact());
    });

    setUp(() {
      contactRepository = MockContactRepository();

      when(() => contactRepository.deleteContact(any()))
          .thenAnswer((_) async {});
    });

    ViewContactBloc buildBloc() {
      return ViewContactBloc(contactRepository: contactRepository);
    }

    group('constructor', () {
      test('works properly', () => expect(buildBloc, returnsNormally));

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
          when(() => contactRepository.deleteContact(any()))
              .thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => ViewContactState(
          contact: mockContact,
          status: ViewContactStatus.success,
        ),
        act: (bloc) => bloc.add(const DeleteContactEvent()),
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
            () => contactRepository.deleteContact(any(that: isA<String>())),
          );
        },
      );

      blocTest<ViewContactBloc, ViewContactState>(
        'emits new state with error if deletion fails',
        build: () {
          when(() => contactRepository.deleteContact(any()))
              .thenThrow(Exception('oops'));
          return buildBloc();
        },
        seed: () => ViewContactState(
          contact: mockContact,
          status: ViewContactStatus.success,
        ),
        act: (bloc) => bloc.add(const DeleteContactEvent()),
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
      blocTest<ViewContactBloc, ViewContactState>(
        'emits new state with updated contact',
        build: buildBloc,
        act: (bloc) => bloc.add(GetContact(contact: mockContact)),
        expect: () => [
          const ViewContactState(
            status: ViewContactStatus.loading,
            contact: Contact(),
          ),
          ViewContactState(
            status: ViewContactStatus.success,
            contact: mockContact,
          ),
        ],
      );
    });
  });
}
