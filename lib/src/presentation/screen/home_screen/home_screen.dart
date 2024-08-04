import 'package:compliance_companion/gen/assets.gen.dart';
import 'package:compliance_companion/src/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/task_list_screen.dart';
import 'package:compliance_companion/src/presentation/screen/tasks_completed/tasks_completed_screen.dart';
import 'package:compliance_companion/src/presentation/widgets/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _screens = [];

  final PageController _pageController = PageController(initialPage: 0);
  late int currentIndex;
  late TaskListScreenBloc taskListBloc;
  late HomeBloc homeBloc;

  @override
  void initState() {
    taskListBloc = BlocProvider.of<TaskListScreenBloc>(context);
    homeBloc = BlocProvider.of<HomeBloc>(context);
    _screens = [
      const TaskListScreen(),
      const TaskCompletedScreen(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    homeBloc.add(TapIconEvent(index));
  }

  void _onPageChanged(int index) {
    homeBloc.add(ChangePageEvent(index));
  }

  String _buildAppBarTitle(int currentIndex) {
    var title = '';
    switch (currentIndex) {
      case 0:
        return title = 'My Task';
      case 1:
        return title = 'Task Completed';
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Initial || state is ChangeHomePage) {
          currentIndex = state.honePageIndex;
        } else if (state is OnTapIcon)  {
          if (state.honePageIndex >= 0 && state.honePageIndex < _screens.length) {
            _pageController.jumpToPage(state.honePageIndex);
          }
        }
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: Text(
              _buildAppBarTitle(state.honePageIndex),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              _buildAvatar(),
            ],
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _screens,
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingBottomNavigationBar(
            currentIcon: currentIndex,
            onTap: (int value) {
              _onItemTapped(value);
            },
            addNewTaskFunctions: () {
              taskListBloc.add(ProcessCreateTaskEvent());
            },
            icons: [
              IconModel(icon: Icons.home, id: 0, label: 'Home'),
              IconModel(icon: Icons.checklist_rtl_sharp, id: 1),
            ],
            isShowAddTask: currentIndex == 0,
          ),
        );
      },
    );
  }

  Widget _buildAvatar() {
    return Container(
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
    );
  }
}
