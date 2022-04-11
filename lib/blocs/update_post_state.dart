import 'package:equatable/equatable.dart';

abstract class UpdatePostState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdatePostInit extends UpdatePostState {}

class UpdatePostLoading extends UpdatePostState {}

class UpdatePostLoaded extends UpdatePostState {
  final bool isUpdate;

  UpdatePostLoaded({this.isUpdate});
}

class UpdatePostError extends UpdatePostState {
  final error;

  UpdatePostError({this.error});
}