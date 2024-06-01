import 'package:bloc_animated_container/moduls/home/bloc/home_bloc.dart';
import 'package:bloc_animated_container/moduls/home/home_page.dart';
import 'package:bloc_animated_container/repositoties/animated_container_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AnimatedContainerRepository(duration: 1),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeBloc(context.read<AnimatedContainerRepository>()),
          )
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
