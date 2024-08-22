import 'package:compliance_companion/gen/assets.gen.dart';
import 'package:compliance_companion/main.dart';
import 'package:compliance_companion/src/app/constant/widget_util.dart';
import 'package:compliance_companion/src/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:compliance_companion/src/presentation/screen/shared_data.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:compliance_companion/src/presentation/widgets/sun_moon_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

mixin HomeScreenMixin<T extends StatefulWidget> on State<T> {
  List<Widget> screens = [];

  final PageController pageController = PageController(initialPage: 0);
  late int currentIndex;
  late TaskListScreenBloc taskListBloc;
  late HomeBloc homeBloc;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var brightness;


  @override
  void initState() {
    super.initState();
    brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;

    taskListBloc = BlocProvider.of<TaskListScreenBloc>(context);
    homeBloc = BlocProvider.of<HomeBloc>(context);
    screens = [
      const TaskListScreen(),
      const TaskCompletedScreen(),
      const CalendarScreen(),
    ];
    initialization();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  void onItemTapped(int index) {
    homeBloc.add(TapIconEvent(index));
  }

  void onPageChanged(int index) {
    homeBloc.add(ChangePageEvent(index));
  }

  String buildAppBarTitle(int currentIndex) {
    var title = '';
    switch (currentIndex) {
      case 0:
        return title = 'My Task';
      case 1:
        return title = 'Task Completed';
      case 2:
        return title = 'Calendar';
    }
    return title;
  }

  Widget buildAvatar() {
    return GestureDetector(
      onTap: () {
        scaffoldKey.currentState!.openEndDrawer();
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.only(right: 16),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            Assets.images.imgAvatar.path,
          ),
        ),
      ),
    );
  }

  Drawer buildRightDrawer(ThemeData theme) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            accountName: const Text("Huy"),
            accountEmail: const Text("huy@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(Assets
                  .images.imgAvatar.path), // Replace with your avatar image
            ),
          ),
          SunMoonToggle(isDay: MyApp.of(context).themeMode != ThemeMode.dark).padding(
            horizontal: 16,
          ),
        ],
      ),
    );
  }
}
