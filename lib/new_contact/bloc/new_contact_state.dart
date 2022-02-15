part of 'new_contact_bloc.dart';

enum NewContactStatus {
  open,
  failure,
  success,
  posting,
}

class NewContactState extends Equatable {
  final Contact contact;
  final NewContactStatus status;
  const NewContactState({
    required this.contact,
    required this.status,
  });

  @override
  List<Object> get props => [contact, status];

  NewContactState copyWith({
    Contact? contact,
    NewContactStatus? status,
  }) {
    return NewContactState(
      contact: contact ?? this.contact,
      status: status ?? this.status,
    );
  }
}
