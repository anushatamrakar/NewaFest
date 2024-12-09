import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newafest/widgets/custom_add_recipe/custom_chef_header.dart';
import 'package:newafest/widgets/custom_app_header.dart';
import 'package:table_calendar/table_calendar.dart';

class ChefCalendar extends StatefulWidget {
  const ChefCalendar({super.key});

  @override
  State<ChefCalendar> createState() => _ChefCalendarState();
}

class _ChefCalendarState extends State<ChefCalendar> {
  Map<DateTime, List<dynamic>> events = {};
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  void loadEvents() {
    // Sample JSON for events
    final jsonString = '''
    [
      {
        "name": "Indira Ekadashi",
        "date": "2024-09-26",
        "description": "A holy day of fasting dedicated to Lord Vishnu."
      },
      {
        "name": "Dashain",
        "date": "2024-09-27",
        "description": "Celebration of victory of good over evil."
      },
      {
        "name": "jatra",
        "date": "2024-12-27",
        "description": "Celebration of victory of good over evil."
      }
    ]
    ''';

    final List<dynamic> eventList = jsonDecode(jsonString);
    Map<DateTime, List<dynamic>> tempEvents = {};

    for (var event in eventList) {
      DateTime date = DateTime.parse(event['date']);
      if (tempEvents[date] == null) {
        tempEvents[date] = [];
      }
      tempEvents[date]!.add(event);
    }

    setState(() {
      events = tempEvents;
    });
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    return events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          const CustomChefHeader(title: 'Newari Calendar'),
          TableCalendar(
            firstDay: DateTime(2024, 1, 1),
            lastDay: DateTime(2024, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.blue,  // Make sure the marker is visible
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _getEventsForDay(_selectedDay).length,
              itemBuilder: (context, index) {
                final event = _getEventsForDay(_selectedDay)[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      event['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(event['description']),
                    leading: const Icon(
                      Icons.event,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
