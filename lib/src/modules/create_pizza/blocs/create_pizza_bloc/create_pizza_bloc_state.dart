part of 'create_pizza_bloc_bloc.dart';

sealed class CreatePizzaBlocState extends Equatable {
  const CreatePizzaBlocState();

  @override
  List<Object> get props => [];
}

final class CreatePizzaBlocInitial extends CreatePizzaBlocState {}

final class CreatePizzaBlocFailure extends CreatePizzaBlocState {}

final class CreatePizzaBlocLoading extends CreatePizzaBlocState {}

final class CreatePizzaBlocSuccess extends CreatePizzaBlocState {}
