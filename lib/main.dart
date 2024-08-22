import 'package:compliance_companion/src/di/dependency_injection.dart';
import 'package:compliance_companion/src/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:compliance_companion/src/presentation/screen/shared_data.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;

  void changeTheme(ThemeMode tm) {
    setState(() {
      themeMode = tm;
    });
  }

  bool isDarkMode() {
    return themeMode == ThemeMode.dark;
  }

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
        theme: ThemeData(),
        darkTheme: ThemeData.dark(), // standard dark theme
        themeMode: themeMode,
        home: const HomeScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

