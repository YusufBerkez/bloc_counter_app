import 'package:bloc_counter_app/bloc/counter_bloc.dart';
import 'package:bloc_counter_app/bloc/counter_event.dart';
import 'package:bloc_counter_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CounterBloc();
      },
      child: MaterialApp(home: MyProject()),
    );
  }
}

class MyProject extends StatelessWidget {
  const MyProject({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  context.read<CounterBloc>().add(ResetEvent());
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecreaseEvent());
                },
                icon: Icon(Icons.remove),
              ),
            ],
            title: Text("Bloc Counter App"),
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
            foregroundColor: Colors.yellow,
          ),
          body: Center(child: Text('${state.counterValue}')),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
