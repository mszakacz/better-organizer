part of 'view_contact_bloc.dart';

enum ViewContactStatus {
  success,
  failure,
  loading,
  deleted,
}

class ViewContactState extends Equatable {
  final Contact contact;
  final ViewContactStatus status;
  const ViewContactState({required this.contact, required this.status});

  @override
  List<Object> get props => [contact, status];

  ViewContactState copyWith({
    Contact? contact,
    ViewContactStatus? status,
  }) {
    return ViewContactState(
      contact: contact ?? this.contact,
      status: status ?? this.status,
    );
  }
}
