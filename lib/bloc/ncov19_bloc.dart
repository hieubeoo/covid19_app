import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid19_app/models/ncov_19.dart';
import 'package:covid19_app/repositories/ncov19_repository.dart';
import 'package:flutter/foundation.dart';
import 'ncov19_event.dart';
import 'ncov19_state.dart';

class Ncov19BlocBloc extends Bloc<Ncov19Event, Ncov19State> {
  final Ncov19Repository ncov19repository;
  Ncov19BlocBloc({@required this.ncov19repository}) : super(Ncov19Initial());

  @override
  Stream<Ncov19State> mapEventToState(
    Ncov19Event event,
  ) async* {
    if (event is Ncov19RequestByCountry) {
      yield Ncov19LoadInProgress();

      try {
        final Ncov19 ncov19 =
            await ncov19repository.getNcov19ByCountry(event.country);
        yield Ncov19LoadSuccessCountry(ncov19: ncov19);
      } catch (_) {
        yield Ncov19LoadFailure();
      }
    }
    if (event is Ncov19RequestAll) {
      yield Ncov19LoadInProgress();
      try {
        final Ncov19 ncov19All = await ncov19repository.getNcov19ByAll();
        yield Ncov19LoadSuccessAllCountry(ncov19All: ncov19All);
      } catch (_) {
        yield Ncov19LoadFailure();
      }
    }
  }
}
