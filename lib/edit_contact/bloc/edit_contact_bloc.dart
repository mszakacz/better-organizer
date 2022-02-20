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
  }

  void _onGetContact(GetContact event, Emitter<EditContactState> emit) {
    emit(state.copyWith(
      status: EditContactStatus.editing,
      contact: event.contact,
    ));
  }
}
