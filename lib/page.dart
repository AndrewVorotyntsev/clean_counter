import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_counter/bloc.dart';
import 'package:clean_counter/events.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.yellow, centerTitle: true, title: Text('Clean Counter')),
        body: BlocBuilder<CounterBloc, int>(
          /* state: int count */
          builder: (BuildContext context, int count) {
            return Center(
              child: Text('$count', style: TextStyle(fontSize: 60)),
            );
          },
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                backgroundColor: Colors.amber,
                child: const Icon(Icons.add),
                onPressed: () =>
                    context.read<CounterBloc>().add(IncrementEvent()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                backgroundColor: Colors.amber,
                child: const Icon(Icons.remove),
                onPressed: () =>
                    context.read<CounterBloc>().add(DecrementEvent()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                backgroundColor: Colors.amber,
                child: const Icon(Icons.exposure_zero),
                onPressed: () =>
                    context.read<CounterBloc>().add(ResetEvent()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
