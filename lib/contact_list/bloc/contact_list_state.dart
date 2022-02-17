part of 'contact_list_bloc.dart';

enum ContactListStatus {
  success,
  loading,
  failure,
}

class ContactListState extends Equatable {
  const ContactListState({
    required this.contactList,
    required this.visibleList,
    required this.searchingWord,
    required this.status,
  });

  final List<Contact> contactList;
  final List<Contact> visibleList;
  final String searchingWord;
  final ContactListStatus status;

  @override
  List<Object> get props => [
        contactList,
        visibleList,
        searchingWord,
        status,
      ];

  ContactListState copyWith({
    List<Contact>? contactList,
    List<Contact>? visibleList,
    String? searchingWord,
    ContactListStatus? status,
  }) {
    return ContactListState(
      contactList: contactList ?? this.contactList,
      visibleList: visibleList ?? this.visibleList,
      searchingWord: searchingWord ?? this.searchingWord,
      status: status ?? this.status,
    );
  }
}
