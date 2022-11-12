import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';

class ScheduleWidget extends StatelessWidget {
  final Task task;

  const ScheduleWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: const Color(0xff2da9ef),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        minLeadingWidth: 2,
        leading: Container(
          width: 2,
          color: const Color(0xff2da9ef),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            task.taskName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          task.description,
          style: TextStyle(
            color: Colors.blue.shade700,
            fontSize: 16,
          ),
        ),
        trailing: Text(
          DateFormat('hh:mm a\ndd/MM').format(task.taskTime),
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class PersonaInfoWidget extends StatelessWidget {
  final PersonaInfo info;
  final bool useEnglish;

  const PersonaInfoWidget({
    Key? key,
    required this.info,
    required this.useEnglish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shadowColor: const Color(0xff2da9ef),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage: ExactAssetImage('assets/images/${info.image}'),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              info.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Text(
            useEnglish ? info.descriptionEng : info.description,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            // textAlign: TextAlign.justify,
          ),
        ));
  }
}
