import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

part 'new_contact_event.dart';
part 'new_contact_state.dart';

class NewContactBloc extends Bloc<NewContactEvent, NewContactState> {
  NewContactBloc()
      : super(const NewContactState(
            contact: Contact(), status: NewContactStatus.initial)) {
    on<MobileEditing>(_onMobileEditing);
  }

  void _onMobileEditing(MobileEditing event, Emitter<NewContactState> emit) {
    emit(state.copyWith(contact: state.contact.copyWith(mobile: event.mobile)));
  }
}
