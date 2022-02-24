import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:contacts_repository/contacts_repository.dart';

part 'view_contact_event.dart';
part 'view_contact_state.dart';

class ViewContactBloc extends Bloc<ViewContactEvent, ViewContactState> {
  ViewContactBloc({required this.contactsRepository})
      : super(
          const ViewContactState(
            contact: Contact(),
            status: ViewContactStatus.success,
          ),
        ) {
    on<DeleteContactEvent>(_onDeleteContactEvent);
    on<GetContact>(_onGetContact);
  }
  final ContactsRepository contactsRepository;

  void _onDeleteContactEvent(
      DeleteContactEvent event, Emitter<ViewContactState> emit) {
    emit(state.copyWith(status: ViewContactStatus.loading));
    try {
      contactsRepository.deleteContact(state.contact.id);
      emit(state.copyWith(status: ViewContactStatus.deleted));
    } catch (e) {
      emit(state.copyWith(status: ViewContactStatus.failure));
    }
  }

  void _onGetContact(GetContact event, Emitter<ViewContactState> emit) async {
    emit(state.copyWith(status: ViewContactStatus.loading));

    try {
      final contact = await contactsRepository.getContact(event.id);
      emit(state.copyWith(status: ViewContactStatus.success, contact: contact));
    } catch (e) {
      emit(state.copyWith(status: ViewContactStatus.failure));
    }
  }
}
