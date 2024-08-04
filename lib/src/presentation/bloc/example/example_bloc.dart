import 'package:bloc/bloc.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(Initial()) {
    on<ExampleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
