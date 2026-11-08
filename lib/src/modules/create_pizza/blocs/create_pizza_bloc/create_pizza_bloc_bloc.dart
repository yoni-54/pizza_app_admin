import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'create_pizza_bloc_event.dart';
part 'create_pizza_bloc_state.dart';

class CreatePizzaBlocBloc
    extends Bloc<CreatePizzaBlocEvent, CreatePizzaBlocState> {
  PizzaRepo pizzaRepo;
  CreatePizzaBlocBloc(this.pizzaRepo) : super(CreatePizzaBlocInitial()) {
    on<CreatePizza>((event, emit) async {
      emit(CreatePizzaBlocLoading());
      try {
        await pizzaRepo.CreatePizzas(event.pizza);
        emit(CreatePizzaBlocSuccess());
      } catch (e) {
        emit(CreatePizzaBlocFailure());
      }
      // TODO: implement event handler
    });
  }
}
