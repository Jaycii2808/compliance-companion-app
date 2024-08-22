import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:compliance_companion/src/app/constant/date_time_util.dart';
import 'package:compliance_companion/src/presentation/widgets/calendar_task_event_item.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CarouselSliderController sliderController = CarouselSliderController();
  int currentDay = DateTime.now().day;
  int currentMonth = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    return buildColumn(context);
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        Text('Tháng $currentMonth'),
        CarouselSlider.builder(
          carouselController: sliderController,
          itemCount: DateTime.now().daysInMonth(),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 6,
            viewportFraction: 0.2,
            initialPage: (currentDay - 1),
            enableInfiniteScroll: false,
            reverse: false,
            onPageChanged: (index, reason) {
              int currentIndex = (index + 1);
              setState(() {
                currentDay = currentIndex;
              });
            },
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            enlargeFactor: 0.25,
            padEnds: true,
            pageSnapping: true,
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            int currentIndex = (itemIndex + 1);
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentDay = currentIndex;
                });
                sliderController.animateToPage(
                  pageViewIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
              child: buildCalendarItem(
                context,
                currentDay,
                currentIndex,
                selectedItemColors(currentDay, currentIndex),
              ),
            );
          },
        ),
        const Divider(),
        Expanded(
          child: TimeListView(),
        ),
        // Expanded(
        //   child: ListView(
        //     children: const [
        //       CalendarTaskEventItem(
        //         time: '10 am - 11 am',
        //         title: 'Daily team call',
        //         color: Colors.pink,
        //       ),
        //       CalendarTaskEventItem(
        //         time: '1 pm - 3 pm',
        //         title: 'Walk through development team',
        //         color: Colors.orange,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  Widget buildCalendarItem(
    BuildContext context,
    int currentDay,
    int currentIndex,
    Color itemColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                color: itemColor,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$currentIndex',
                    style: const TextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('$currentIndex'.getDateDetails()['weekendDay']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color selectedItemColors(int currentDay, int currentIndex) {
    // log('currentDay == currentIndex: ${currentDay == currentIndex}');
    return (currentDay ) == currentIndex ? Colors.black : Colors.black54;
  }
}

class TimeSlot {
  final String label;
  final TimeOfDay time;

  TimeSlot({required this.label, required this.time});
}

class TimeListView extends StatelessWidget {
  final List<TimeSlot> events = [
    TimeSlot(label: 'Daily team call', time: const TimeOfDay(hour: 10, minute: 0)),
    TimeSlot(
        label: 'Walk through development team',
        time: const TimeOfDay(hour: 13, minute: 0)),
  ];

  TimeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length * 2,
      itemBuilder: (context, index) {
        final eventIndex = index ~/ 2; // Every second item is an event
        if (index.isEven) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "${events[eventIndex].time.format(context)}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        } else {
          final event = events[eventIndex];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: event.label == 'Daily team call'
                ? Colors.pink[200]
                : Colors.orange[200],
            child: ListTile(
              title: Text(event.label),
              subtitle: Text(
                  "${event.time.format(context)} - ${(event.time.hour + 1).toString()} ${event.time.period == DayPeriod.am ? 'am' : 'pm'}"),
            ),
          );
        }
      },
    );
  }
}
