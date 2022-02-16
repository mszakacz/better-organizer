import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:contact_list_repository/contact_list_repository.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactListBloc({required this.repository})
      : super(ContactListLoadingState()) {
    repository
        .constactList()
        .listen((contacts) => add(GetContactListEvent(contacts)));
    on<GetContactListEvent>(_onGetContactListEvent);
  }

  final ContactListRepository repository;

  void _onGetContactListEvent(
      GetContactListEvent event, Emitter<ContactListState> emit) {
    emit(ContactListLoadingState());
    emit(HasContactListState(event.contactList));
  }

  // @override
  // Stream<ContactListState> mapEventToState(ContactListEvent event) async* {
  //   if (event is GetContactListEvent) {
  //     yield HasContactListState(event.contactList);
  //   }
  // }
}
