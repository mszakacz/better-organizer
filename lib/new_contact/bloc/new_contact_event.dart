part of 'new_contact_bloc.dart';

abstract class NewContactEvent extends Equatable {
  const NewContactEvent();

  @override
  List<Object> get props => [];
}

class PostContact extends NewContactEvent {}

class NameEditing extends NewContactEvent {
  final String name;
  const NameEditing(this.name);
}

class LastnameEditing extends NewContactEvent {
  final String lastname;
  const LastnameEditing(this.lastname);
}

class MobileEditing extends NewContactEvent {
  final String mobile;
  const MobileEditing(this.mobile);
}

class MailEditing extends NewContactEvent {
  final String mail;
  const MailEditing(this.mail);
}

class AddressEditing extends NewContactEvent {
  final String address;
  const AddressEditing(this.address);
}

class DesctriptionEditing extends NewContactEvent {
  final String description;
  const DesctriptionEditing(this.description);
}
