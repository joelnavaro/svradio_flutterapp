import 'package:flutter/material.dart';

class ScheduleContainer extends StatefulWidget {
  const ScheduleContainer({super.key});

  @override
  State<ScheduleContainer> createState() => _ScheduleContainerState();
}

class _ScheduleContainerState extends State<ScheduleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('schedules'),
      );
  }
}