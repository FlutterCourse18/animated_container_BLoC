import 'package:bloc_animated_container/moduls/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetAnimatedContainerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          context.read<HomeBloc>().add(GetAnimatedContainerEvent());
        },
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is HomeSuccessState) {
              return AnimatedContainer(
                width: state.data.width,
                height: state.data.height,
                decoration: BoxDecoration(
                  color: state.data.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                duration: Duration(seconds: state.data.duration),
                curve: Curves.fastOutSlowIn,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
