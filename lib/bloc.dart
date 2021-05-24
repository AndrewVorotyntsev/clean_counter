import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_counter/events.dart';
import 'package:clean_counter/logic.dart';
import 'package:clean_counter/data_inf.dart';

class CounterBloc extends Bloc<CounterEvent, int> with CounterLogic {

  CounterBloc(int count) : super(count);

  // Обеспечиваем доступ к данным, подходящий платформе платформе
  DataInf _dataInf = (kIsWeb) ? SharedPrefsAccess() : SharedPrefsAccess();

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      int newState = increment(state);
      _dataInf.setData(newState);
      yield newState;
    }
    else if (event is DecrementEvent) {
      int newState = decrement(state);
      _dataInf.setData(newState);
      yield newState;
    }
    else if (event is ResetEvent) {
      int newState = reset();
      _dataInf.setData(newState);
      yield newState;
    }
  }
}