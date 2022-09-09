import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_film/models/models.dart';
import 'package:flutter_film/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // UserBloc() : super(UserInitial());
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      User user = await SharedPref.getSession();

      yield UserLoaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      User updatedUser = (state as UserLoaded)
          .user
          .copyWith(name: event.name, profilePicture: event.profileImage);
      await UserServices.updateUser(updatedUser);

      yield UserLoaded(updatedUser);
    } else if (event is TopUp) {
      try {
        User updatedUser = (state as UserLoaded).user.copyWith(
            balance: (state as UserLoaded).user.balance + event.amount);

        await UserServices.updateUser(updatedUser);

        yield UserLoaded(updatedUser);
      } catch (e) {
        print(e);
      }
    } else if (event is Purchase) {
      try {
        User updatedUser = (state as UserLoaded).user.copyWith(
            balance: (state as UserLoaded).user.balance - event.amount);

        await UserServices.updateUser(updatedUser);

        yield UserLoaded(updatedUser);
      } catch (e) {
        print(e);
      }
    }
  }
}
