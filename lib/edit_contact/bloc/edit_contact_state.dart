part of 'edit_contact_bloc.dart';

enum EditContactStatus {
  editing,
  posting,
  success,
  failure,
}

class EditContactState extends Equatable {
  const EditContactState({
    required this.status,
    required this.contact,
  });

  final EditContactStatus status;
  final Contact contact;

  @override
  List<Object> get props => [status, contact];

  EditContactState copyWith({
    EditContactStatus? status,
    Contact? contact,
  }) {
    return EditContactState(
      status: status ?? this.status,
      contact: contact ?? this.contact,
    );
  }
}
