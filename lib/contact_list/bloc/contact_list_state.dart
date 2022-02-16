part of 'contact_list_bloc.dart';

abstract class ContactListState extends Equatable {
  const ContactListState();

  @override
  List<Object> get props => [];
}

class ContactListLoadingState extends ContactListState {}

class HasContactListState extends ContactListState {
  const HasContactListState(this.contactList);

  final List<Contact> contactList;

  @override
  List<Object> get props => [contactList];
}
