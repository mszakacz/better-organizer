part of 'new_contact_bloc.dart';

abstract class NewContactEvent extends Equatable {
  const NewContactEvent();

  @override
  List<Object> get props => [];
}

class AddContact extends NewContactEvent {
  const AddContact();

  @override
  List<Object> get props => [];
}

class NameEditing extends NewContactEvent {
  final String name;
  const NameEditing(this.name);

  @override
  List<Object> get props => [name];
}

class LastnameEditing extends NewContactEvent {
  final String lastname;
  const LastnameEditing(this.lastname);

  @override
  List<Object> get props => [lastname];
}

class MobileEditing extends NewContactEvent {
  final String mobile;
  const MobileEditing(this.mobile);

  @override
  List<Object> get props => [mobile];
}

class MailEditing extends NewContactEvent {
  final String mail;
  const MailEditing(this.mail);

  @override
  List<Object> get props => [mail];
}

class AddressEditing extends NewContactEvent {
  final String address;
  const AddressEditing(this.address);

  @override
  List<Object> get props => [address];
}

class DesctriptionEditing extends NewContactEvent {
  final String description;
  const DesctriptionEditing(this.description);

  @override
  List<Object> get props => [description];
}
