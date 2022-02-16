part of 'contact_list_bloc.dart';

abstract class ContactListEvent extends Equatable {
  const ContactListEvent();

  @override
  List<Object> get props => [];
}

class GetContactListEvent extends ContactListEvent {
  const GetContactListEvent(this.contactList);

  final List<Contact> contactList;
}
