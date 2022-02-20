part of 'view_contact_bloc.dart';

abstract class ViewContactEvent extends Equatable {
  const ViewContactEvent();

  @override
  List<Object> get props => [];
}

class DeleteContactEvent extends ViewContactEvent {
  const DeleteContactEvent();

  @override
  List<Object> get props => [];
}

class RefreshContactData extends ViewContactEvent {
  const RefreshContactData();

  @override
  List<Object> get props => [];
}

class GetContact extends ViewContactEvent {
  const GetContact({required this.id});
  final String id;

  @override
  List<Object> get props => [id];
}
