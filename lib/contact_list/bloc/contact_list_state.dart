part of 'contact_list_bloc.dart';

enum ContactListStatus {
  success,
  loading,
  failure,
}

class ContactListState {
  const ContactListState({
    required this.contactList,
    required this.visibleList,
    required this.status,
  });

  final List<Contact> contactList;
  final List<Contact> visibleList;
  final ContactListStatus status;

  @override
  List<Object> get props => [contactList, visibleList, status];

  ContactListState copyWith({
    List<Contact>? contactList,
    List<Contact>? visibleList,
    ContactListStatus? status,
  }) {
    return ContactListState(
      contactList: contactList ?? this.contactList,
      visibleList: visibleList ?? this.visibleList,
      status: status ?? this.status,
    );
  }
}
