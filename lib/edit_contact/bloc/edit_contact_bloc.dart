import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:contacts_repository/contacts_repository.dart';
import 'package:flutter/material.dart';

part 'edit_contact_event.dart';
part 'edit_contact_state.dart';

class EditContactBloc extends Bloc<EditContactEvent, EditContactState> {
  EditContactBloc({required this.contactsRepository})
      : super(const EditContactState(
          status: EditContactStatus.editing,
          contact: Contact(),
        )) {
    on<GetContact>(_onGetContact);
    on<SaveChanges>(_onSaveChanges);
    on<NameEditing>(_onNameEditing);
    on<LastnameEditing>(_onLastnameEditing);
    on<MobileEditing>(_onMobileEditing);
    on<MailEditing>(_onMailEditing);
    on<AddressEditing>(_onAddressEditing);
    on<DesctriptionEditing>(_onDescriptionEditing);
  }

  final ContactsRepository contactsRepository;

  void _onGetContact(GetContact event, Emitter<EditContactState> emit) {
    emit(state.copyWith(
      status: EditContactStatus.editing,
      contact: event.contact,
    ));
  }

  Future<void> _onSaveChanges(
      SaveChanges event, Emitter<EditContactState> emit) async {
    emit(state.copyWith(status: EditContactStatus.posting));
    try {
      await contactsRepository.editContact(state.contact);
      emit(state.copyWith(status: EditContactStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EditContactStatus.failure));
    }
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
