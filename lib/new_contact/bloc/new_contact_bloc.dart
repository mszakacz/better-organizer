import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

part 'new_contact_event.dart';
part 'new_contact_state.dart';

class NewContactBloc extends Bloc<NewContactEvent, NewContactState> {
  NewContactBloc()
      : super(const NewContactState(
            contact: Contact(), status: NewContactStatus.initial)) {
    on<NameEditing>(_onNameEditing);
    on<MobileEditing>(_onMobileEditing);
    on<LastnameEditing>(_onLastnameEditing);
    on<MailEditing>(_onMailEditing);
    on<AddressEditing>(_onAddressEditing);
    on<DesctriptionEditing>(_onDescriptionEditing);
    on<AddContact>(_onAddContact);
  }

  void _onNameEditing(NameEditing event, Emitter<NewContactState> emit) {
    emit(state.copyWith(contact: state.contact.copyWith(name: event.name)));
  }

  void _onLastnameEditing(
      LastnameEditing event, Emitter<NewContactState> emit) {
    emit(state.copyWith(
        contact: state.contact.copyWith(lastname: event.lastname)));
  }

  void _onMobileEditing(MobileEditing event, Emitter<NewContactState> emit) {
    emit(state.copyWith(contact: state.contact.copyWith(mobile: event.mobile)));
  }

  void _onMailEditing(MailEditing event, Emitter<NewContactState> emit) {
    emit(state.copyWith(contact: state.contact.copyWith(mail: event.mail)));
  }

  void _onAddressEditing(AddressEditing event, Emitter<NewContactState> emit) {
    emit(state.copyWith(
        contact: state.contact.copyWith(address: event.address)));
  }

  void _onDescriptionEditing(
      DesctriptionEditing event, Emitter<NewContactState> emit) {
    emit(state.copyWith(
        contact: state.contact.copyWith(description: event.description)));
  }

  void _onAddContact(AddContact event, Emitter<NewContactState> emit) {}
}
