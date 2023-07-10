import 'package:equatable/equatable.dart';

abstract class Errors extends Equatable {}

class offlineError extends Errors {
  @override
  List<Object?> get props => [];
}

class ServerError extends Errors {
  @override
  List<Object?> get props => [];
}
