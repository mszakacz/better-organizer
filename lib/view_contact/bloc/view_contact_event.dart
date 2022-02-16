part of 'view_contact_bloc.dart';

abstract class ViewContactEvent extends Equatable {
  const ViewContactEvent();

  @override
  List<Object> get props => [];
}

class DeleteContactEvent extends ViewContactEvent {}

class RefreshContactData extends ViewContactEvent {}

class GetUser extends ViewContactEvent {
  const GetUser({required this.contact});
  final Contact contact;

  @override
  List<Object> get props => [contact];
}
