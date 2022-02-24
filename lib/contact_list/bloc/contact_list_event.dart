part of 'contact_list_bloc.dart';

abstract class ContactListEvent extends Equatable {
  const ContactListEvent();

  @override
  List<Object> get props => [];
}

class GetContactListEvent extends ContactListEvent {
  const GetContactListEvent({required this.contactList});

  final List<Contact> contactList;

  @override
  List<Object> get props => [contactList];
}

class SearchEvent extends ContactListEvent {
  const SearchEvent({required this.searchingWord});

  final String searchingWord;

  @override
  List<Object> get props => [searchingWord];
}
