part of 'create_pizza_bloc_bloc.dart';

sealed class CreatePizzaBlocEvent extends Equatable {
  const CreatePizzaBlocEvent();

  @override
  List<Object> get props => [];
}

class CreatePizza extends CreatePizzaBlocEvent {
  final Pizza pizza;

  const CreatePizza(this.pizza);

  @override
  List<Object> get props => [pizza];
}
