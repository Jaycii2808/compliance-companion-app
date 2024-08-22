import 'package:compliance_companion/gen/assets.gen.dart';
import 'package:compliance_companion/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SunMoonToggle extends StatefulWidget {
  final bool isDay;
  const SunMoonToggle({super.key, required this.isDay});

  @override
  State<SunMoonToggle> createState() => _SunMoonToggleState();
}

class _SunMoonToggleState extends State<SunMoonToggle>
    with SingleTickerProviderStateMixin {

  Duration animationDurationTemp = const Duration(milliseconds: 1000);
  late AnimationController _animationController;
  bool isDay = true;
  bool isLongPress = true;

  @override
  void initState() {
    super.initState();
    isDay =  widget.isDay;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double toggleHeight = 40;
    double toggleWidth = 80;
    return Stack(
      children: [
              Positioned.fill(
                child: Center(
                  child: AnimatedCrossFade(
                    firstChild: Container(
                      height: toggleHeight,
                      width: toggleWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromRGBO(35, 132, 186, 1),
                      ),
                    ),
                    secondChild: Container(
                      height: toggleHeight,
                      width: toggleWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromRGBO(47, 47, 47, 1),
                      ),
                    ),
                    crossFadeState: isDay
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: _animationController.duration!,
                  ),
                ),
              ),
        Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: _onChange,
                    child: Container(
                      height: toggleHeight,
                      width: toggleWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: _animationController.duration!,
                            bottom: 0,
                            right: 0,
                            left: 0,
                            height: isDay ? toggleHeight : 0,
                            child: SizedBox(
                              height: toggleHeight,
                              width: toggleWidth,
                              child: SvgPicture.asset(
                                width: toggleWidth - 10,
                                height: toggleHeight - 10,
                                Assets.images.imgToggleCloud,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: _animationController.duration!,
                            top: 0,
                            bottom: 0,
                            left: isDay ? 0 : (toggleWidth - toggleHeight),
                            child: Stack(
                              children: [
                                if (isDay) ...[
                                  Container(
                                    width: toggleWidth / 1.4,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius:
                                        BorderRadius.circular(100)),
                                  ),
                                  Container(
                                    width: toggleWidth / 1.9,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius:
                                        BorderRadius.circular(100)),
                                  ),
                                ],
                                Container(
                                  padding: isDay
                                      ? const EdgeInsets.only(
                                    left: 6,
                                    top: 10,
                                    bottom: 6,
                                    right: 8,
                                  )
                                      : EdgeInsets.zero,
                                  decoration: isDay
                                      ? BoxDecoration(
                                    color:
                                    Colors.white.withOpacity(0.1),
                                    borderRadius:
                                    BorderRadius.circular(100),
                                  )
                                      : null,
                                  child: AnimatedOpacity(
                                    opacity: isDay ? 1 : 0,
                                    duration: _animationController.duration!,
                                    child: SvgPicture.asset(
                                      width: toggleWidth - (toggleWidth/10),
                                      height: toggleHeight - (toggleHeight/10),
                                      Assets.icons.icToggleSun,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedPositioned(
                            duration: _animationController.duration!,
                            right: 0,
                            left: 0,
                            bottom: isDay ? toggleHeight : 0,
                            child: SizedBox(
                              height: toggleHeight,
                              width: toggleWidth,
                              child: SvgPicture.asset(
                                width: toggleWidth - 10,
                                height: toggleHeight - 10,
                                Assets.images.imgToggleStar,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: _animationController.duration!,
                            top: 0,
                            bottom: 0,
                            // right: !isDay ? 0 : (toggleWidth - toggleHeight),
                            right: !isDay
                                ? 0
                                : (toggleWidth - toggleHeight),
                            child: Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                if (!isDay) ...[
                                  Container(
                                    width: toggleWidth / 1.4,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius:
                                      BorderRadius.circular(100),
                                    ),
                                  ),
                                  Container(
                                    width: toggleWidth / 1.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius:
                                      BorderRadius.circular(100),
                                    ),
                                  ),
                                ],
                                Container(
                                  padding: !isDay
                                      ? const EdgeInsets.only(
                                    left: 8,
                                    top: 10,
                                    bottom: 6,
                                    right: 6,
                                  )
                                      : EdgeInsets.zero,
                                  decoration: !isDay
                                      ? BoxDecoration(
                                    color:
                                    Colors.white.withOpacity(0.1),
                                    borderRadius:
                                    BorderRadius.circular(100),
                                  )
                                      : null,
                                  child: AnimatedOpacity(
                                    opacity: !isDay ? 1 : 0,
                                    duration: _animationController.duration!,
                                    child: SvgPicture.asset(
                                      width: toggleWidth - (toggleWidth/10),
                                      height: toggleHeight - (toggleHeight/10),
                                      Assets.icons.icToggleMoon,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _onChange() {
          setState(() {
            isDay = !isDay;
            if (isDay) {
              MyApp.of(context).changeTheme(ThemeMode.light);
            } else {
              MyApp.of(context).changeTheme(ThemeMode.dark);
            }
          });
        }
}