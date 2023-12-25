import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_client/src/modules/counter/counter_bloc.dart';
// import 'package:music_app_client/src/modules/counter/counter_cubit.dart';
import 'package:music_app_client/src/modules/counter/counter_event.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.title});

  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // late CounterCubit _cubit;
  late CounterBloc _bloc;

  @override
  void initState() {
    super.initState();
    // _cubit = CounterCubit(0);
    _bloc = CounterBloc(0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      bloc: _bloc,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                // '${_cubit.state}',
                '$state',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'increment',
              onPressed: () {
                // // cubit
                // setState(() {
                //   _cubit.increment();
                // });

                // // bloc
                // setState(() {
                //   _bloc.add(CounterIncrementPressed());
                // });
                _bloc.add(CounterIncrementPressed());
                // context.read<CounterBloc>().add(CounterIncrementPressed()); //BlocProvider
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag: 'decrement',
              onPressed: () {
                // // cubit
                // setState(() {
                //   _cubit.decrement();
                // });

                // // bloc
                // setState(() {
                //   _bloc.add(CounterDecrementPressed());
                // });
                _bloc.add(CounterDecrementPressed());
                // context.read<CounterBloc>().add(CounterDecrementPressed());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.minimize),
            ),
            FloatingActionButton(
              heroTag: 'reset',
              onPressed: () {
                // // cubit
                // setState(() {
                //   _cubit.reset();
                // });

                // // bloc
                // setState(() {
                //   _bloc.add(CounterResetPressed());
                // });
                _bloc.add(CounterResetPressed());
                // context.read<CounterBloc>().add(CounterResetPressed());
              },
              tooltip: 'Reset',
              child: const Icon(Icons.restart_alt),
            ),
          ],
        ),
      ),
    );
  }
}
