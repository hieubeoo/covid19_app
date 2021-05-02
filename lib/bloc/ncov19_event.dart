import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class Ncov19Event extends Equatable {
  const Ncov19Event();
}

class Ncov19RequestByCountry extends Ncov19Event {
  final String country;
  const Ncov19RequestByCountry({@required this.country});
  @override
  List<Object> get props => [country];
}

class Ncov19RequestAll extends Ncov19Event {
  const Ncov19RequestAll();
  @override
  List<Object> get props => [];
}
