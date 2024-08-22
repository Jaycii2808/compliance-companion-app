import 'package:compliance_companion/gen/assets.gen.dart';
import 'package:compliance_companion/src/presentation/screen/home_screen/bloc/home_bloc.dart';
import 'package:compliance_companion/src/presentation/screen/home_screen/home_screen_mixin.dart';
import 'package:compliance_companion/src/presentation/screen/task_list_screen/bloc/task_list_screen_bloc.dart';
import 'package:compliance_companion/src/presentation/widgets/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with HomeScreenMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Initial || state is ChangeHomePage) {
          currentIndex = state.honePageIndex;
        } else if (state is OnTapIcon) {
          if (state.honePageIndex >= 0 &&
              state.honePageIndex < screens.length) {
            pageController.jumpToPage(state.honePageIndex);
          }
        }
        return Scaffold(
          key: scaffoldKey,
          extendBody: true,
          appBar: AppBar(
            title: Text(
              buildAppBarTitle(state.honePageIndex),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              buildAvatar(),
            ],
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (index) => onPageChanged(index),
            children: screens,
          ),
          endDrawer: buildRightDrawer(theme),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingBottomNavigationBar(
            currentIcon: currentIndex,
            onTap: (int value) {
              onItemTapped(value);
            },
            addNewTaskFunctions: () {
              taskListBloc.add(ProcessCreateTaskEvent());
            },
            icons: [
              IconModel(icon: Icons.home, id: 0, label: 'Home'),
              IconModel(icon: Icons.checklist_rtl_sharp, id: 1),
              IconModel(icon: Icons.calendar_today, id: 2),
            ],
            isShowAddTask: currentIndex == 0,
          ),
        );
      },
    );
  }
}
