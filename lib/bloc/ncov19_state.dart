import 'package:covid19_app/models/ncov_19.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Ncov19State extends Equatable {
  const Ncov19State();
  @override
  List<Object> get props => [];
}

class Ncov19Initial extends Ncov19State {}

class Ncov19LoadInProgress extends Ncov19State {}

class Ncov19LoadSuccessCountry extends Ncov19State {
  final Ncov19 ncov19;

  Ncov19LoadSuccessCountry({@required this.ncov19});
  @override
  List<Object> get props => [ncov19];
}

class Ncov19LoadSuccessAllCountry extends Ncov19State {
  final Ncov19 ncov19All;

  Ncov19LoadSuccessAllCountry({@required this.ncov19All});
  @override
  List<Object> get props => [ncov19All];
}

class Ncov19LoadFailure extends Ncov19State {}
