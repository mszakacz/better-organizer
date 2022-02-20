import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:contact_list_repository/contact_list_repository.dart';
import 'package:flutter/material.dart';

part 'edit_contact_event.dart';
part 'edit_contact_state.dart';

class EditContactBloc extends Bloc<EditContactEvent, EditContactState> {
  EditContactBloc()
      : super(const EditContactState(
          status: EditContactStatus.editing,
          contact: Contact(),
        )) {
    on<GetContact>(_onGetContact);
    on<NameEditing>(_onNameEditing);
    on<LastnameEditing>(_onLastnameEditing);
    on<MobileEditing>(_onMobileEditing);
    on<MailEditing>(_onMailEditing);
    on<AddressEditing>(_onAddressEditing);
    on<DesctriptionEditing>(_onDescriptionEditing);
  }

  void _onGetContact(GetContact event, Emitter<EditContactState> emit) {
    emit(state.copyWith(
      status: EditContactStatus.editing,
      contact: event.contact,
    ));
  }

  void _onNameEditing(NameEditing event, Emitter<EditContactState> emit) {
    emit(state.copyWith(contact: state.contact.copyWith(name: event.name)));
  }

  void _onLastnameEditing(
      LastnameEditing event, Emitter<EditContactState> emit) {
    emit(state.copyWith(
        contact: state.contact.copyWith(lastname: event.lastname)));
  }

  void _onMobileEditing(MobileEditing event, Emitter<EditContactState> emit) {
    emit(state.copyWith(contact: state.contact.copyWith(mobile: event.mobile)));
  }

  void _onMailEditing(MailEditing event, Emitter<EditContactState> emit) {
    emit(state.copyWith(contact: state.contact.copyWith(mail: event.mail)));
  }

  void _onAddressEditing(AddressEditing event, Emitter<EditContactState> emit) {
    emit(state.copyWith(
        contact: state.contact.copyWith(address: event.address)));
  }

  void _onDescriptionEditing(
      DesctriptionEditing event, Emitter<EditContactState> emit) {
    emit(state.copyWith(
        contact: state.contact.copyWith(description: event.description)));
  }
}
