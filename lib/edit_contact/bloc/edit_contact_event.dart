part of 'edit_contact_bloc.dart';

abstract class EditContactEvent extends Equatable {
  const EditContactEvent();

  @override
  List<Object> get props => [];
}

class GetContact extends EditContactEvent {
  const GetContact({required this.contact});
  final Contact contact;

  @override
  List<Object> get props => [contact];
}

class SaveChanges extends EditContactEvent {
  const SaveChanges();

  @override
  List<Object> get props => [];
}

class NameEditing extends EditContactEvent {
  final String name;
  const NameEditing(this.name);

  @override
  List<Object> get props => [name];
}

class LastnameEditing extends EditContactEvent {
  final String lastname;
  const LastnameEditing(this.lastname);

  @override
  List<Object> get props => [lastname];
}

class MobileEditing extends EditContactEvent {
  final String mobile;
  const MobileEditing(this.mobile);

  @override
  List<Object> get props => [mobile];
}

class MailEditing extends EditContactEvent {
  final String mail;
  const MailEditing(this.mail);

  @override
  List<Object> get props => [mail];
}

class AddressEditing extends EditContactEvent {
  final String address;
  const AddressEditing(this.address);

  @override
  List<Object> get props => [address];
}

class DesctriptionEditing extends EditContactEvent {
  final String description;
  const DesctriptionEditing(this.description);

  @override
  List<Object> get props => [description];
}
