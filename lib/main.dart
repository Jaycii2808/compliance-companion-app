import 'package:compliance_companion/src/di/dependency_injection.dart';
import 'package:compliance_companion/src/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:compliance_companion/src/presentation/screen/home_screen/home_screen.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TaskListScreenBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
