import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactListBloc({required this.contactsRepository})
      : super(
          const ContactListState(
            status: ContactListStatus.loading,
            contactList: <Contact>[],
            visibleList: <Contact>[],
            searchingWord: '',
          ),
        ) {
    contactsRepository.contactList().listen(
          (contacts) => add(
            GetContactListEvent(contactList: contacts),
          ),
        );
    on<GetContactListEvent>(_onGetContactListEvent);
    on<SearchEvent>(_onSearchEvent);
  }

  final ContactsRepository contactsRepository;

  void _onGetContactListEvent(
      GetContactListEvent event, Emitter<ContactListState> emit) {
    emit(state.copyWith(status: ContactListStatus.loading));
    emit(
      state.copyWith(
        contactList: event.contactList,
        visibleList: event.contactList,
        status: ContactListStatus.success,
        searchingWord: '',
      ),
    );
  }

  void _onSearchEvent(SearchEvent event, Emitter<ContactListState> emit) {
    emit(state.copyWith(status: ContactListStatus.loading));
    List<Contact> _contactList = state.contactList;
    List<Contact> _searchList = [];
    final String _searchingWord = event.searchingWord.toLowerCase();
    for (var contact in _contactList) {
      if (contact.name.toLowerCase().contains(_searchingWord) ||
          contact.lastname.toLowerCase().contains(_searchingWord)) {
        _searchList.add(contact);
      }
    }

    emit(state.copyWith(
      visibleList: _searchList,
      status: ContactListStatus.success,
      searchingWord: event.searchingWord,
    ));
  }
}
