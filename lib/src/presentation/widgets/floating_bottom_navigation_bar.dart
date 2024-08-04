import 'package:compliance_companion/src/app/constant/string_util.dart';
import 'package:flutter/material.dart';

class IconModel {
  final IconData icon;
  final int id;
  final String? label;

  IconModel({required this.icon, required this.id, this.label});
}

class FloatingBottomNavigationBar extends StatefulWidget {
  final int currentIcon;
  final List<IconModel> icons;
  final ValueChanged<int>? onTap;
  final Function()? addNewTaskFunctions;
  final bool isShowAddTask;

  const FloatingBottomNavigationBar({
    Key? key,
    required this.currentIcon,
    required this.onTap,
    required this.icons,
    required this.addNewTaskFunctions,
    required this.isShowAddTask,
  }) : super(key: key);

  @override
  State<FloatingBottomNavigationBar> createState() =>
      _FloatingBottomNavigationBarState();
}

class _FloatingBottomNavigationBarState
    extends State<FloatingBottomNavigationBar> {
  int currentId = 1;
  List<Widget> listIcon = [];

  @override
  void initState() {
    currentId = widget.currentIcon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(20),
        // padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: widget.icons
                    .map(
                      (icon) => GestureDetector(
                        onTap: () {
                          currentId = icon.id;
                          widget.onTap?.call(icon.id);
                        },
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 900),
                          child: Row(
                            children: [
                              Icon(
                                icon.icon,
                                size: currentId == icon.id ? 26 : 23,
                                color: currentId == icon.id
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              if (icon.label.isNotNullOrEmpty())
                                Text(
                                  icon.label!,
                                  style: TextStyle(
                                    color: currentId == icon.id
                                        ? Colors.black
                                        : Colors.grey,
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            widget.isShowAddTask
                ? Container(
                    height: MediaQuery.of(context).size.height / 12,
                    // width: MediaQuery.of(context).size.width/6,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: widget.addNewTaskFunctions,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        // size: 16
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height / 12,
                    padding: const EdgeInsets.all(8),
                  )
          ],
        ),
      ),
    );
  }
}
