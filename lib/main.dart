import 'package:clean_counter/data_inf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_counter/page.dart';
import 'package:clean_counter/bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  // Обеспечиваем доступ к данным, подходящим платформе способом
  DataInf _dataInf =
      (kIsWeb) ? SharedPrefsAccess() : SharedPrefsAccess();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: _dataInf.getData(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                print("Get state from prefs ${snapshot.data}");
                return BlocProvider(
                    create: (BuildContext context) =>
                        CounterBloc(snapshot.data ?? 0),
                    child: CounterPage());
              }
          }
        });
  }
}
