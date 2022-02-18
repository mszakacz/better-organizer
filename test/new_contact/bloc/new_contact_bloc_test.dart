import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:better_organizer/new_contact/bloc/new_contact_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

class MockContactRepository extends Mock implements ContactRepository {}

class FakeContact extends Fake implements Contact {}

void main() {
  final mockContacts = [
    const Contact(
      id: '1',
      name: 'name1',
      lastname: 'lastname1',
      mobile: 'mobile1',
      mail: 'mail1',
      address: 'address1',
      description: 'description1',
    ),
    const Contact(
      id: '2',
      name: 'name2',
      lastname: 'lastname2',
      mobile: 'mobile2',
      mail: 'mail2',
      address: 'address2',
      description: 'description2',
    ),
    const Contact(
      id: '3',
      name: 'name3',
      lastname: 'lastname3',
      mobile: 'mobile3',
      mail: 'mail3',
      address: 'address3',
      description: 'description3',
    ),
  ];
  group(
    'NewContactBloc',
    () {
      late ContactRepository contactRepository;

      setUpAll(() {
        registerFallbackValue(FakeContact());
      });

      setUp(() {
        contactRepository = MockContactRepository();
        // when(() => contactRepository.addNewContact(any()))
        //     .thenAnswer((_) async {});
      });

      NewContactBloc buildBloc() {
        return NewContactBloc(
          contactRepository: contactRepository,
        );
      }

      group('constructor', () {
        test('works properly', () {
          expect(buildBloc, returnsNormally);
        });

        test('has correct initial state', () {
          expect(
            buildBloc().state,
            equals(NewContactBloc(contactRepository: contactRepository)),
          );
        });
      });

      group('NewContactAddContact', () {
        blocTest<NewContactBloc, NewContactState>(
          'saves contact using reposiotry',
          build: buildBloc,
          act: (bloc) => bloc.add(AddContact()),
          expect: () => [
            const NewContactState(
                contact: Contact(), status: NewContactStatus.posting),
            const NewContactState(
                contact: Contact(), status: NewContactStatus.failure),
          ],
        );
      });
    },
  );
}
